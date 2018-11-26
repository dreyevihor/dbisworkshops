from flask import render_template, request, redirect
from app import app

question = {
	"ID" : 1,
	"text" : "zsdasdasdasasd",
    "question_set_id": 1
}

option = {
    "ID": 1,
    "text": "zsdaasdasdasdasdsdasdasasd",
    "question_id": 1
}


@app.route('/')
@app.route('/home')
def home():
    """Renders the home page."""
    return render_template(
        'index.html',
        title='Home Page',
    )

#
# @app.route('/contact')
# def contact():
#
# 	"""Renders the contact page."""
# 	#return render_template(
# 	#    'contact.html',
# 	#    title='Contact',
# 	#    year=datetime.now().year,
# 	#    message='Your contact page.'
# 	#)
#
# 	return User["NAME"]


# @app.route('/about')
# def about():
# 	"""Renders the about page."""
# 	#return render_template(
# 	#    'about.html',
# 	#    title='About',
# 	#    year=datetime.now().year,
# 	#    message='Your application description page.'
# 	User["NAME"] = "Name";
# 	return User["NAME"]
# 	#)

@app.route('/api/<action>', methods = ['POST', 'GET'])
def api(action):
	if request.method == 'GET':
		if action == 'question':
			return render_template(
				'question.html',
				Q=question
			)
		elif action == 'option':
			return render_template(
				'option.html',
				O=option
			)
		elif action == 'all':
			return render_template(
				'all.html',
                Q=question,
                O=option
			)
		else:
			return render_template('404.html', a=action, availble=['question', 'option', 'all']), 404

	if request.method == 'POST':
		if action == 'question':
			question['text'] = request.form['text']
			question['question_set_id'] = request.form['question_set_id']
			return render_template(
                'question.html',
                Q=question
            )
		elif action == 'option':
			option['text'] = request.form['text']
			option['question_id'] = request.form['question_id']
			return render_template('option.html', O=option)
		else:
			return render_template('404.html'), 404