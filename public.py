from flask import *
from database import *
public=Blueprint('public',__name__)

@public.route('/')
def home():
	return render_template('home.html')

@public.route('/login',methods=['get','post'])
def login():
	if 'submit' in request.form:
		username=request.form['username']
		password=request.form['password']
		print(username,password)
		q="select * from login where username='%s' and password='%s'"%(username,password)
		res=select(q)
		if res:
        	 if res[0]['usertype']=="admin":
        	 	return redirect(url_for('admin.admin_home'))
	return render_template('login.html')