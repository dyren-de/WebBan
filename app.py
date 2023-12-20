import base64

from flask import Flask, json, request
import os

from install.sql import init_db
from session.session import Session

app = Flask(__name__)

init_db()

# get secret key from env var
app.config["SECRET"] = os.environ.get("SECRET")
app.config["API_KEY"] = os.environ.get("API_KEY")


# @app.route("/api/v1/verify/<session>")
# def verify(session: Session):
#    if session.is_valid():
#        return {"status": "success"}
#    else:
#        return {"status": "fail"}


@app.route("/")
def hello_world():
    return """
    <h1>Dyren WebBan</h1>
    <a href="/debug/secret">Debug Secret</a>
    <br>
    <a href="/new/token/12345/api_key">New Token</a>
    <br>
    <a href="/debug/session/xyz">Debug Session</a>
    """


@app.route("/new/token/<uuid>/<api_key>", methods=["GET"])
def new_token(uuid, api_key):
    if api_key == app.config["API_KEY"]:
        session = Session(uuid)
        session_string = session.to_string()
        return {"token": session_string}
    else:
        return {"message": "login failed use: GET /new/token/<uuid>/<secret>"}, 401


# todo remove!!!
@app.route("/debug/secret")
def debug_secret():
    # reture secret key as json
    return {"secret": app.config["SECRET"]}


@app.route("/debug/session/<session_string>")
def debug_session(session_string):
    session = Session.from_string(session_string)
    if session is None:
        return {"error": "invalid session"}, 401
    print(session)
    print(session.is_valid())
    valid_until = session.valid_until.isoformat()
    session_id = session.session_id[2:-3] #only show the id without the tuple brackets
    uuid = session.uuid
    checksum = session.checksum
    status_code = 200 if session.is_valid() else 401
    return (
        {"session_string": session_string,
         "valid": session.is_valid(),
         "valid_until": valid_until,
         "session_id": session_id,
         "uuid": uuid,
         "checksum": checksum},
        status_code)

@app.route("/login/<session_string>")
def login(session_string):
    session = Session.from_string(session_string)
    if session is None:
        return {"error": "invalid session, try logging in again"}, 401
    current_cookie = request.cookies.get("session")
    print("Current Cookie: " + str(current_cookie))
    if session.is_valid():
        #set session cookie
        resp = app.make_response("Valid Session")
        resp.set_cookie("session", session_string)
        return resp, 200
    else:
        return {"error": 'Session is no longer valid, please get another go ingame and run: /bansysten login'}, 401 #todo set correct command

@app.route("/logout")
def logout():
    resp = app.make_response({"message": "Logged out"})
    resp.set_cookie("session", "", expires=0)
    return resp, 200