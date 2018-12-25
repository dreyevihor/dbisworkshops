from flask import Flask
from config import Config

from auth.views import *

app = Flask(__name__)
app.config.from_object(Config)
app.add_url_rule('/registration/', view_func=RegistrationView.as_view('registration'))
app.add_url_rule('/login/', view_func=LoginView.as_view('login'))

@app.route('/')
def hello_world():
    return 'Hello World!'


if __name__ == '__main__':
    app.run()
