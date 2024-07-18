* preparation

install docker
have the dev container extension in vscode

* commands

    ```
    # reopen in container
    mkdir app
    touch app/main.py
    poetry init
    # package is the app

    # install what you need to the service
    poetry add flask
    poetry add gunicorn
    # install what you need just for write code
    poetry add -G dev pytest pytest-cov
    poetry add -G dev black
    poetry add -G dev isort
    # after all installed, select interpreter to the poetry one
    # open locally then reopen, you are good to go
    ```

    main.py
    ```
    from flask import Flask

    app = Flask(__name__)

    @app.route("/hello", methods=["GET"])
    def hello():
        return {
            "hello": "its up"
        }


    if __name__ == "__main__":
        app.run(host="0.0.0.0", port=8000)
    ```

### notes on windows

https://github.com/microsoft/vscode-remote-release/issues/9399

for now, if you click, reopen in container, the git will act blur.
Need to manually click refresh

unless you do clone in WSL.