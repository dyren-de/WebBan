import base58
import os
def generate_id():
    random_bytes = os.urandom(4)  # Using 4 bytes to generate a 6-character base58 string
    base58_string = base58.b58encode(random_bytes).decode('utf-8')[:6]
    print(base58_string)
    return base58_string