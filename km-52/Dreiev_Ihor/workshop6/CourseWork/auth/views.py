from flask.views import MethodView
from flask import render_template
from auth import *
import cx_Oracle
from db import *

__all__ = ('RegistrationView', 'LoginView')


from hashlib import md5

def get_password_hash(password):
    return md5(bytes(password, 'utf8')).hexdigest()

def check_password(password, hash):
    return md5(bytes(password, 'utf8')).hexdigest() == hash

class RegistrationView(MethodView):
    def get(self):
        form = RegistrationForm()
        return render_template('registration.html', form=form)

    def post(self):
        form = RegistrationForm()
        if form.validate_on_submit():
            try:
                connection = cx_Oracle.connect(conection_str, mode=cx_Oracle.SYSDBA)
                cursor = connection.cursor()
                password_hash = get_password_hash(form.password.data)
                cursor.callproc('question_pack.add_customer',
                                [form.full_name.data,
                                password_hash,
                                form.username.data]
                                )
                connection.commit()
                cursor.close()
                connection.close()
            except:
                form.username.errors.append('Користувач з таким логіном існує')
            return render_template('registration.html', form=form)
        return render_template('registration.html', form=form)


class LoginView(MethodView):
    def get(self):
        form = LoginForm()
        return render_template('login.html', form=form)
    def post(self):
        pass