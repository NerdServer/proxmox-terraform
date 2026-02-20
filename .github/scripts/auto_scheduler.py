import os, sys, urllib.request, urllib.error, json, ssl, re

def get_best_node():
    url_env = os.environ.get("TF_VAR_proxmox_api_url", "https://10.0.0.7:8006")
    url = str(url_env).rstrip("/") if url_env else "https://10.0.0.7:8006"
    if str(url).endswith("/api2/json"):
        url = str(url)[:-10]
    url = url + "/api2/json/nodes"
    
    token_id = os.environ.get("TF_VAR_proxmox_api_token_id")
    token_secret = os.environ.get("TF_VAR_proxmox_api_token_secret")
    
    if not token_id or not token_secret:
        print("Missing API token credentials in environment. Skipping auto-scheduler.")
        return None
        
    hdr = { "Authorization": f"PVEAPIToken={token_id}={token_secret}" }
    ctx = ssl._create_unverified_context()
    req = urllib.request.Request(url, headers=hdr)
    
    best_node = None
    try:
        with urllib.request.urlopen(req, context=ctx) as response:
            data = json.loads(response.read().decode())
            nodes = []
            for n in data['data']:
                if n['status'] == 'online':
                    # Calculate score: memory usage percentage
                    mem_pct = n['mem'] / n['maxmem']
                    nodes.append((n['node'], mem_pct))
            
            if not nodes:
                print("No online nodes found.")
                return None
                
            nodes.sort(key=lambda x: x[1])  # sort by lowest memory usage
            best_node = nodes[0][0]
            print(f"[Auto-Scheduler] Node loads: {[(n, f'{p*100:.1f}%') for n, p in nodes]}")
            print(f"[Auto-Scheduler] Selected optimal node: {best_node}")
            return best_node
    except urllib.error.HTTPError as e:
        print(f"HTTP Error querying Proxmox API: {e}")
        print(e.read().decode())
        return None
    except Exception as e:
        print(f"Failed to query Proxmox API: {e}")
        return None

def process_yaml(file_path):
    if not os.path.exists(file_path):
        print(f"File {file_path} not found.")
        return

    best_node = None
    with open(file_path, 'r') as f:
        content = f.read()

    # Check if action is needed before making API call
    if not re.search(r'target_node:\s*["\']?auto["\']?', content, re.IGNORECASE):
        print(f"[Auto-Scheduler] No 'target_node: \"auto\"' entries found in {file_path}. Skipping.")
        return

    best_node = get_best_node()
    if not best_node:
        print(f"[Auto-Scheduler] Could not determine best node. Leaving YAML unchanged.")
        return
        
    new_content = re.sub(r'(target_node:\s*)["\']?auto["\']?', r'\g<1>"' + best_node + '"', content, flags=re.IGNORECASE)
    
    with open(file_path, 'w') as f:
        f.write(new_content)
    print(f"[Auto-Scheduler] Successfully updated {file_path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python auto_scheduler.py <path_to_yaml_file>")
        sys.exit(1)
        
    target_file = sys.argv[1]
    process_yaml(target_file)
