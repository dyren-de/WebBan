import base64
import hashlib
import hmac
import os
from datetime import datetime, timedelta

from utility import generate_id


class Session:
    def __init__(self, uuid, valid_until: datetime = datetime.now() + timedelta(minutes=15)):
        self.session_id = generate_id(),
        self.valid_until = valid_until
        self.uuid = uuid

        self.checksum = self.generate_checksum()

    def generate_checksum(self):
        message = f"{self.session_id}:{self.valid_until}:{self.uuid}".encode('utf-8')
        secret_key = os.environ.get("SECRET").encode('utf-8')
        hash_obj = hmac.new(secret_key, message, hashlib.sha256)
        return base64.urlsafe_b64encode(hash_obj.digest()).decode('utf-8')

    def is_checksum_valid(self):
        recalculated_checksum = self.generate_checksum()
        return recalculated_checksum == self.checksum

    def is_valid(self):
        return datetime.now() < self.valid_until and self.is_checksum_valid()

    def to_string(self):
        string = f"{self.session_id}#{self.valid_until}#{self.uuid}#{self.checksum}"

        encoded_bytes = base64.b64encode(string.encode('utf-8'))
        return encoded_bytes.decode('utf-8')

    @staticmethod
    def from_string(session_string):
        try:
            # always check if the session is valid (this is not done here)
            decoded_bytes = base64.b64decode(session_string)
            decoded_string = decoded_bytes.decode('utf-8')

            print(decoded_string)

            session_id, valid_until, uuid, checksum = decoded_string.split("#")
            valid_until = datetime.fromisoformat(valid_until)
            session = Session(uuid, valid_until)
            session.session_id = session_id
            session.checksum = checksum

            if not session.is_valid():
                if not session.is_checksum_valid():
                    raise Exception("WARN: Checksum is not valid!")  # someone tried to manipulate the session
                raise Exception("Session is not valid")
            else:
                return session
        except Exception as e:
            print(e)
            return None
