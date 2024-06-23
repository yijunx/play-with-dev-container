* commands

    ```
    mkdir app
    touch app/main.py
    poetry init
    # package is the app
    poetry add flask
    poetry add gunicorn
    poetry add -G dev pytest
    poetry add -G dev black
    poetry add -G dev isort
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
