import urllib.request, json, ssl, os

url = os.environ.get("TF_VAR_proxmox_api_url", "https://10.0.0.7:8006").rstrip("/") + "/api2/json/nodes"
token_id = os.environ.get("TF_VAR_proxmox_api_token_id")
token_secret = os.environ.get("TF_VAR_proxmox_api_token_secret")

hdr = { "Authorization": f"PVEAPIToken={token_id}={token_secret}" }
ctx = ssl._create_unverified_context()
req = urllib.request.Request(url, headers=hdr)

try:
    with urllib.request.urlopen(req, context=ctx) as response:
        data = json.loads(response.read().decode())
        nodes = []
        for n in data['data']:
            if n['status'] == 'online':
                mem_pct = n['mem'] / n['maxmem']
                cpu_usage = n['cpu']
                nodes.append((n['node'], mem_pct, cpu_usage))
        
        nodes.sort(key=lambda x: x[1])  # sort by memory usage
        print(f"Nodes sorted by memory usage: {nodes}")
        best_node = nodes[0][0]
        print(f"Best node: {best_node}")
except Exception as e:
    print("FAILED")
    if hasattr(e, 'read'):
        print(e.read().decode())
    else:
        print(e)
