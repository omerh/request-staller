import random
import time

from flask import Flask

app = Flask(__name__)


@app.route("/")
def stall():
    stalling = random.uniform(0, 1)
    time.sleep(stalling)
    return f"done stalling for {stalling}"


if __name__ == '__main__':
    app.run(port=8080, host="0.0.0.0", debug=False, threaded=True)