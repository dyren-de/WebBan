from flask import Flask
import os

app = Flask(__name__)

#get secret key from env var
app.config["SECRET"] = os.environ.get("SECRET")
print("Secret: {}".format(app.config["SECRET"]))

def create_token(uuid:str, valid_until:str):
    #todo
    return "1234"
def veryify_token(token):
    #todo
    return True

@app.route("/api/v1/verify/<token>")
def verify(token):
    if veryify_token(token):
        return {"status": "success"}
    else:
        return {"status": "fail"}


@app.route("/")
def hello_world():
    return """
    <h1>Dyren WebBan</h1>
    <a href="/debug/secret">Debug Secret</a>
    <br>
    <a href="/new/token/1234">New Token</a>
    """


@app.route("/new/token/<uuid>")
def new_token(uuid):
    return "<p>Token: {}</p>".format(uuid)

#todo remove
@app.route("/debug/secret")
def debug_secret():
    #reture secret key as json
    return {"secret": app.config["SECRET"]}