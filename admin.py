from flask import *
from database import *
from datetime import datetime as dt


import smtplib
from email.mime.text import MIMEText
from flask_mail import Mail

admin=Blueprint('admin',__name__)

@admin.route('/admin_home')
def admin_home():
	return render_template('admin_home.html')

@admin.route('/admin_manage_employee',methods=['get','post'])
def admin_manage_employee():
	data={}
	q="select * from designations"
	res=select(q)
	data['desi']=res


	
	if 'submit' in request.form:
		firstname=request.form['Firstname']
		lastname=request.form['Lastname']
		housename=request.form['housename']
		designation=request.form['designation']
		dob=request.form['dob']
		gender=request.form['Gender']
		qualification=request.form['Qualification']
		phonenumber=request.form['Phone']
		email=request.form['Email']
		place=request.form['Place']
		username=request.form['username']
		password=request.form['password']
		z="insert into login values(null,'%s','%s','employee')"%(username,password)
		id=insert(z)
		q="insert into employee values(null,'%s','%s','%s','%s','%s',curdate(),'%s','%s','%s','%s','%s','%s')"%(id,firstname,lastname,housename,designation,dob,gender,qualification,phonenumber,email,place)
		insert(q)
		try:
			gmail = smtplib.SMTP('smtp.gmail.com', 587)
			gmail.ehlo()
			gmail.starttls()
			gmail.login('projectsriss2020@gmail.com','messageforall')
		except Exception as e:
			print("Couldn't setup email!!"+str(e))
		msg = MIMEText("Your Username is " + username +" and password is " + password  )
		msg['Subject'] = 'Your Username and Password'
		msg['To'] = email
		msg['From'] = 'projectsriss2020@gmail.com'
		try:
			gmail.send_message(msg)
			print(msg)
			print(email)
			flash('ASSIGNED SUCCESS..')
		except Exception as e:
			print("COULDN'T SEND EMAIL", str(e))
			flash("Something Went Wrong...")

		return redirect(url_for('admin.admin_manage_employee'))
	return render_template('admin_manage_employee.html',data=data)

@admin.route('/admin_view_employee',methods=['get','post'])
def admin_view_employee():
	data={}
	z="select * from employee inner join designations using(designation_id)"
	res=select(z)
	data['emp']=res

	if 'action' in request.args:
		action=request.args['action']
		emp_id=request.args['emp_id']
	else:
		action=None

	if action=="delete":
		q="delete from employee where employee_id='%s'"%(emp_id)
		delete(q)
		return redirect(url_for('admin.admin_view_employee'))

	if action=="update":
		q="select * from employee where employee_id='%s'"%(emp_id)
		res=select(q)
		data['empl']=res
		if 'submit' in request.form:
			firstname=request.form['Firstname']
			lastname=request.form['Lastname']
			housename=request.form['housename']
			phonenumber=request.form['phone']
			email=request.form['email']
			place=request.form['place']
			q="update employee set first_name='%s',last_name='%s',house_name='%s',phone='%s',email='%s',place='%s' where employee_id='%s'"%(firstname,lastname,housename,phonenumber,email,place,emp_id)
			update(q)
			return redirect(url_for('admin.admin_view_employee'))
	return render_template('admin_view_employee.html',data=data)


@admin.route('/admin_manage_work',methods=['get','post'])
def admin_manage_work():
	data={}
	q="select * from works"
	res=select(q)
	data['desi']=res
	if 'submit' in request.form:
		title=request.form['title']
		description=request.form['description']
		place=request.form['place']
		latitude=request.form['latitude']
		longitude=request.form['longitude']
		
		
		# z="insert into works values(null,'%s','%s','%s','%s','%s','%s','%s')"
		# id=insert(z)
		q="insert into works values(null,'%s','%s','%s','%s','%s','available',curdate())"%(title,description,place,latitude,longitude)
		insert(q)
		return redirect(url_for('admin.admin_manage_work'))
	return render_template('admin_manage_works.html',data=data)


@admin.route('/admin_view_work',methods=['get','post'])
def admin_view_work():
	data={}
	z="select * from works"
	res=select(z)
	data['wor']=res

	if 'action' in request.args:
		action=request.args['action']
		wor_id=request.args['wor_id']
	else:
		action=None

	if action=="delete":
		q="delete from works where work_id='%s'"%(wor_id)
		delete(q)
		return redirect(url_for('admin.admin_view_work'))

	if action=="update":
		q="select * from works where work_id='%s'"%(wor_id)
		res=select(q)
		data['workss']=res
		if 'submit' in request.form:
			title=request.form['title']
			description=request.form['description']
			place=request.form['place']
			
			q="update works set title='%s',description='%s',place='%s' where work_id='%s'"%(title,description,place,wor_id)
			update(q)
			return redirect(url_for('admin.admin_view_work'))
	return render_template('admin_view_work.html',data=data)

@admin.route('/admin_view_attendence',methods=['get','post'])
def admin_view_attendence():
	data={}
	emp_id=request.args['emp_id']
	z="select * from attendances where employee_id='%s' "%(emp_id)
	res=select(z)
	data['att']=res
	diff=res[0]['out_time']-res[0]['in_time']
	print(diff)

	if 'action' in request.args:
		action=request.args['action']
		att_id=request.args['att_id']
	else:
		action=None
		
	return render_template('admin_view_attendence.html',data=data)



@admin.route('/admin_manage_designation',methods=['get','post'])
def admin_manage_designation():
	data={}

	q="select * from designations"
	res=select(q)
	data['desi']=res
	
	if 'submit' in request.form:
		designation_name=request.form['designation_name']
		q="insert into designations values(null,'%s')"%(designation_name)
		insert(q)
		return redirect(url_for('admin.admin_manage_designation'))
	return render_template('admin_manage_designation.html',data=data)


@admin.route('/admin_view_designation',methods=['get','post'])
def admin_view_designation():
	data={}
	z="select * from designations"
	res=select(z)
	data['desig']=res

	if 'action' in request.args:
		action=request.args['action']
		desig_id=request.args['desig_id']
	else:
		action=None

	if action=="delete":
		q="delete from designations where designation_id='%s'"%(desig_id)
		delete(q)
		return redirect(url_for('admin.admin_view_designation'))

	if action=="update":
		q="select * from designations where designation_id='%s'"%(desig_id)
		res=select(q)
		data['updesig']=res
		if 'submit' in request.form:
			designation_name=request.form['designation_name']
			q="update designations set designation_name='%s'where designation_id='%s'"%(designation_name,desig_id)
			update(q)
			return redirect(url_for('admin.admin_view_designation'))
	return render_template('admin_view_designation.html',data=data)

@admin.route('/admin_manage_leave',methods=['get','post'])
def admin_manage_leave():
	data={}
	q="select * from leave_types"
	res=select(q)
	data['desi']=res
	if 'submit' in request.form:
		leave_type_name=request.form['leave_type_name']
		description=request.form['description']
		q="insert into leave_types values(null,'%s','%s')"%(leave_type_name,description)
		insert(q)
		return redirect(url_for('admin.admin_manage_leave'))
	return render_template('admin_manage_leave.html',data=data)


@admin.route('/admin_view_leave',methods=['get','post'])
def admin_view_leave():
	data={}
	z="select * from leave_types"
	res=select(z)
	data['leave']=res

	if 'action' in request.args:
		action=request.args['action']
		leave_id=request.args['leave_id']
	else:
		action=None

	if action=="delete":
		q="delete from leave_types where  leave_type_id='%s'"%(leave_id)
		delete(q)
		return redirect(url_for('admin.admin_view_leave'))

	if action=="update":
		q="select * from leave_types where  leave_type_id='%s'"%(leave_id)
		res=select(q)
		data['upleave']=res
		if 'submit' in request.form:
			leave_type_name=request.form['leave_type_name']
			description=request.form['description']

			q="update leave_types set leave_type_name='%s',description='%s'where leave_type_id='%s'"%(leave_type_name,description,leave_id)
			update(q)
			return redirect(url_for('admin.admin_view_leave'))
	return render_template('admin_view_leave.html',data=data)

# @admin.route('/admin_manage_salary',methods=['get','post'])
# def admin_manage_salary():
# 	data={}
# 	emp_id=request.args['emp_id']
# 	if 'submit' in request.form:
# 		basic_salary=request.form['basic_salary']
# 		house_rent=request.form['house_rent']
# 		special_allowance=request.form['special_allowance']
# 		overtime_allowance=request.form['overtime_allowance']
# 		travel_allowance=request.form['travel_allowance']
# 		income_tax=request.form['income_tax']
# 		now = dt.now()
		  
# 		# Example 1
# 		s = now.strftime("%Y-%m")+"%"
# 		q="select count(leave_app_id) as li from leave_applications where employee_id='%s' and applied_to_date like '%s'" %(emp_id,s)
# 		print(q)
# 		res=select(q)
# 		if res:
# 			if int(res[0]['li'])>3:
# 				nli=int(res[0]['li'])-3
# 				print(nli)
# 				value=(int(basic_salary)*int(nli))/100
# 				content=int(basic_salary)-value
# 			else:
# 				content=basic_salary
# 		dates=
# 		q="select * from overtimes where employee_id='%s' and date_time like " %(emp_id)
# 		q="insert into salary values(null,'%s','%s','%s','%s','%s','%s','%s')"%(emp_id,content,house_rent,special_allowance,overtime_allowance,travel_allowance,income_tax)
# 		insert(q)
# 		print(q)
# 		return redirect(url_for('admin.admin_manage_salary',emp_id=emp_id))
# 	return render_template('admin_manage_salary.html',data=data,emp_id=emp_id)

@admin.route('/admin_manage_salary',methods=['get','post'])
def admin_manage_salary():
	data={}
	emp_id=request.args['emp_id']
	if 'submit' in request.form:
		basic_salary=request.form['basic_salary']
		house_rent=request.form['house_rent']
		special_allowance=request.form['special_allowance']
		travel_allowance=request.form['travel_allowance']
		income_tax=request.form['income_tax']
		now = dt.now()
		  
		# Example 1
		s = now.strftime("%Y-%m")+"%"
		q="select count(leave_app_id) as li from leave_applications where employee_id='%s' and applied_to_date like '%s'" %(emp_id,s)
		print(q)
		res=select(q)
		if res:
			if int(res[0]['li'])>3:
				nli=int(res[0]['li'])-3
				print(nli)
				value=(int(basic_salary)*int(nli))/100
				content=int(basic_salary)-value
			else:
				content=basic_salary
		q="select sum(extra_hour) as eh from overtimes where employee_id='%s'  and date_time like '%s'" %(emp_id,s)
		print(q)
		res=select(q)
		print(res)
		vals=0
		if res:
			if res[0]['eh']!=None:
				vals=int(res[0]['eh'])*10
				# contents=int(content)+int(vals)

		
		# else:
			# contents=content
		print(vals)

		q="insert into salary values(null,'%s','%s','%s','%s','%s','%s','%s')"%(emp_id,content,house_rent,special_allowance,vals,travel_allowance,income_tax)
		insert(q)
		print(q)
		return redirect(url_for('admin.admin_manage_salary',emp_id=emp_id))
	return render_template('admin_manage_salary.html',data=data,emp_id=emp_id)



@admin.route('/admin_view_salary',methods=['get','post'])
def admin_view_salary():
	data={}
	z="select * from salary inner join employee using(employee_id)"
	res=select(z)
	data['salary']=res

	if 'action' in request.args:
		action=request.args['action']
		salary_id=request.args['salary_id']
	else:
		action=None

	if action=="delete":
		q="delete from salary where  pay_id='%s'"%(salary_id)
		delete(q)
		return redirect(url_for('admin.admin_view_salary'))
	
	return render_template('admin_view_salary.html',data=data)

@admin.route('/admin_manage_overtime',methods=['get','post'])
def admin_manage_overtime():
	data={}
	emp_id=request.args['emp_id']
	if 'submit' in request.form:
		extra_hour=request.form['extra_hour']
		q="insert into overtimes values(null,'%s',curdate(),'%s')"%(extra_hour,emp_id)
		insert(q)
		return redirect(url_for('admin.admin_manage_overtime',emp_id=emp_id))
	return render_template('admin_manage_overtime.html',emp_id=emp_id)

@admin.route('/admin_view_overtime',methods=['get','post'])
def admin_view_overtime():
	data={}
	z="select * from overtimes inner join employee using(employee_id)"
	res=select(z)
	data['over']=res

	if 'action' in request.args:
		action=request.args['action']
		over_id=request.args['over_id']
	else:
		action=None

	if action=="delete":
		q="delete from overtimes where  overtime_id='%s'"%(over_id)
		delete(q)
		return redirect(url_for('admin.admin_view_overtime'))
	if action=="update":
		q="select * from overtimes where  overtime_id='%s'"%(over_id)
		res=select(q)
		data['upover']=res
		if 'submit' in request.form:
			extra_hour=request.form['extra_hour']
			q="update overtimes set extra_hour='%s'where overtime_id='%s'"%(extra_hour,over_id)
			update(q)
			return redirect(url_for('admin.admin_view_overtime'))
	return render_template('admin_view_overtime.html',data=data)

@admin.route('/admin_view_image',methods=['get','post'])
def admin_view_image():
	data={}
	emp_id=request.args['emp_id']
	z="select * from images where employee_id='%s' "%(emp_id) 
	res=select(z)
	data['img']=res

	if 'action' in request.args:
		action=request.args['action']
		img_id=request.args['img_id']
	else:
		action=None

	return render_template('admin_view_image.html',data=data)


@admin.route('/admin_view_leave_applications',methods=['get','post'])
def admin_view_leave_applications():
	data={}
	z="select * from leave_applications inner join leave_types using(leave_type_id) inner join employee using(employee_id)"
	res=select(z)
	data['leave']=res

	if 'action' in request.args:
		action=request.args['action']
		leave_id=request.args['leave_id']
	else:
		action=None
	if action=='accept':
		q="update leave_applications set status='accept' where leave_app_id='%s'"%(leave_id)
		update(q)
		return redirect(url_for('admin.admin_view_leave_applications'))
	if action=='reject':
		q="update leave_applications set status='reject' where leave_app_id='%s'"%(leave_id)
		update(q)
		return redirect(url_for('admin.admin_view_leave_applications'))

	return render_template('admin_view_leave_applications.html',data=data)

@admin.route('/admin_view_locations',methods=['get','post'])
def admin_view_locations():
	data={}
	e_id=request.args['emp_id']
	z="select * from locations where employee_id='%s'" %(e_id)
	res=select(z)
	data['loc']=res

	
	return render_template('admin_view_locations.html',data=data)

@admin.route('/admin_view_assigned_works',methods=['get','post'])
def admin_view_assigned_works():
	data={}
	z="select * from assigned_works inner join employee using(employee_id)"
	res=select(z)
	data['assigned']=res

	if 'action' in request.args:
		action=request.args['action']
		assigned_id=request.args['assigned_id']
	else:
		action=None

	return render_template('admin_view_assigned_works.html',data=data)


@admin.route('/admin_manage_assigned_works',methods=['get','post'])
def admin_manage_assigned_works():

	data={}
	q="select * from employee"
	res=select(q)
	data['employee']=res
	wor_id=request.args['wor_id']

	if 'submit' in request.form:
		employee=request.form['employee']
		q="select * from leave_applications where applied_to_date=curdate() and employee_id='%s' and status='accept'"%(employee)
		
		print(q)
		res=select(q)
		if res:
			flash("employee is on leave")
		else:

			q="insert into assigned_works values(null,'%s','%s',now(),'pending')"%(wor_id,employee)
			insert(q)
		return redirect(url_for('admin.admin_manage_assigned_works',wor_id=wor_id))
	return render_template('admin_manage_assigned_works.html',data=data)























		
	

