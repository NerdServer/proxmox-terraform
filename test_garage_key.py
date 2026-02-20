import urllib.request, datetime, hashlib, hmac

access_key = "GKeb70bef3e2ccc12e0f0be515"
secret_key = "77f4f585826dd1f6230cb5154782e22f69c5db7a2eade0558c37896a33c987bd"
region = "garage"
endpoint = "10.0.50.4:30188"
bucket = "terraform-tstates"

def sign(k, msg): return hmac.new(k, msg.encode("utf-8"), hashlib.sha256).digest()

t = datetime.datetime.now(datetime.timezone.utc)
amz_date = t.strftime('%Y%m%dT%H%M%SZ')
datestamp = t.strftime('%Y%m%d')

canonical_uri = '/' + bucket
canonical_querystring = 'list-type=2'

canonical_headers = 'host:' + endpoint + '\n' + 'x-amz-date:' + amz_date + '\n'
signed_headers = 'host;x-amz-date'
payload_hash = hashlib.sha256(''.encode('utf-8')).hexdigest()

canonical_request = 'GET\n' + canonical_uri + '\n' + canonical_querystring + '\n' + canonical_headers + '\n' + signed_headers + '\n' + payload_hash
credential_scope = datestamp + '/' + region + '/s3/aws4_request'
string_to_sign = 'AWS4-HMAC-SHA256\n' + amz_date + '\n' + credential_scope + '\n' + hashlib.sha256(canonical_request.encode('utf-8')).hexdigest()

signing_key = sign(sign(sign(sign(('AWS4' + secret_key).encode('utf-8'), datestamp), region), 's3'), 'aws4_request')
signature = hmac.new(signing_key, string_to_sign.encode('utf-8'), hashlib.sha256).hexdigest()

authorization_header = 'AWS4-HMAC-SHA256 Credential=' + access_key + '/' + credential_scope + ', SignedHeaders=' + signed_headers + ', Signature=' + signature

req = urllib.request.Request("http://"+endpoint+canonical_uri + "?" + canonical_querystring)
req.add_header('x-amz-date', amz_date)
req.add_header('Authorization', authorization_header)
req.add_header('x-amz-content-sha256', payload_hash)

try:
    with urllib.request.urlopen(req) as response:
        print(response.read().decode('utf-8')[:300])
except Exception as e:
    if hasattr(e, 'read'):
        print("ERROR: " + e.read().decode('utf-8'))
    else:
        print("ERROR: ", e)
