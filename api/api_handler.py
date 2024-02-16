"""
This file acts as a router and coordinator, delegating tasks to other functions (within server.py) that handle the core logic.<br>
The list of routes this files needs to handle are as follows:
* User verification (aadhar,pan,etc) [POST,GET]
* Research papers [GET]
* Researcher verification [GET]
* Forum base chat room [POST,GET]
* Researcher-Voluenteer chat room [POST,GET]
* User profile details [POST,GET]
"""


from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/mail", methods=["POST"])
def mail():
    """Handles POST requests for accepting/rejecting the candiate by the instution.

    Returns:
        A JSON response containing information.
    """

    if not request.is_json:
        return jsonify({"error": "Request must be JSON"}), 400

    # do something with request
    request_json = request.get_json()
    return True

@app.route("/profiles", methods=["GET"])
def profiles():
    """Handles GET requests for user profile

    Returns:
        A JSON response containing information.
    """

    if not request.is_json:
        return jsonify({"error": "Request must be JSON"}), 400

    # do something with request
    request_json = request.get_json()
    return True

if __name__ == "__main__":
    print("running on localhost:5000")
    app.run(debug=True, host="0.0.0.0", port=5000)
