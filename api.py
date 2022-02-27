from flask import *
from database import *
import demjson
import uuid

api=Blueprint('api',__name__)

@api.route('/login')
def login():
	data={}
	username=request.args['username']
	password=request.args['password']
	q="select * from login where username='%s' and password='%s'"%(username,password)
	res=select(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	return demjson.encode(data)


@api.route('/view_salary')
def view_salary():
	data={}
	pid=request.args['pid']

	q="select * from salary inner join employee using(employee_id) where employee_id=(select employee_id from employee where login_id='%s')"%(pid) 
	res=select(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	return demjson.encode(data)

@api.route('/view_designation')
def view_designation():
	data={}
	q="select * from designations"
	res=select(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	return demjson.encode(data)


@api.route('/view_assigned_works')
def view_assigned_works():
	data={}
	lid=request.args['lid']
	q="select *,assigned_works.status as astatus from assigned_works inner join employee using(employee_id) inner join works using(work_id) where employee_id=(select employee_id from employee where login_id='%s')"%(lid)
	res=select(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	data['method']="view_assigned_works"
	return demjson.encode(data)

@api.route('/updatestatus')
def updatestatus():
	data={}
	aid=request.args['aid']
	q="update assigned_works set status='completed' where assign_id='%s'"%(aid)
	update(q)
	data['status']="success"
	data['method']="updatestatus"
	return demjson.encode(data)


@api.route('/view_overtime')
def view_overtime():
	data={}
	overid=request.args['overid']
	q="select * from overtimes inner join employee using(employee_id) where employee_id=(select employee_id from employee where login_id='%s')"%(overid) 
	res=select(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	return demjson.encode(data)


@api.route('/view_attendence')
def view_attendence():
	data={}
	attid=request.args['attid']
	q="select * from attendances inner join employee using(employee_id) where employee_id=(select employee_id from employee where login_id='%s')"%(attid) 
	res=select(q)
	print(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	return demjson.encode(data)

@api.route('/view_location')
def view_location():
	data={}
	loc_id=request.args['loc_id']
	q="select * from locations inner join employee using(employee_id) where employee_id=(select employee_id from employee where login_id='%s')"%(loc_id)
	res=select(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	return demjson.encode(data)

@api.route('/view_works')
def view_works():
	data={}
	works_id=request.args['works_id']
	q="select * from works"
	res=select(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	return demjson.encode(data)

@api.route('/view_profile')
def view_profile():
	data={}
	lid=request.args['lid']
	q="select * from employee where login_id='%s'"%(lid)
	res=select(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	return demjson.encode(data)


@api.route('/employeeapplyforleave')
def employeeapplyforleave():
	data={}
	lid=request.args['lid']
	apto=request.args['apto']
	numberofdays=request.args['numberofdays']
	reason=request.args['reason']
	types=request.args['types']
	q="select * from leave_applications where (applied_to_date='%s' and employee_id=(select employee_id from employee where login_id='%s') and status='accept') or (applied_to_date='%s' and employee_id=(select employee_id from employee where login_id='%s') and status='pending')"%(apto,lid,apto,lid)
		
	print(q)
	res=select(q)
	if not res:
		q="insert into leave_applications values(null,(select employee_id from employee where login_id='%s'),'%s',curdate(),'%s','%s','%s','pending')"%(lid,types,apto,numberofdays,reason)
		insert(q)
		data['status']="success"
	else:
		data['status']="aa"

		
	data['method']="employeeapplyforleave"
	return demjson.encode(data)



@api.route('/viewleavetypes')
def viewleavetypes():
	data={}
	q="select * from leave_types"
	res=select(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	data['method']="viewleavetypes"
	return demjson.encode(data)

@api.route('/view_leave_application_status')
def view_leave_application_status():
	data={}
	lid=request.args['lid']
	q="select * from leave_applications where employee_id=(select employee_id from employee where login_id='%s')"%(lid)
	res=select(q)
	if res:
		data['status']="success"
		data['data']=res
	else:
		data['status']="failed"
	return demjson.encode(data)

	
@api.route('/uploadfile/',methods=['get','post'])
def uploadfile():
	data={}
	lid=request.form['lid']
	image=request.files['image']
	lati=request.form['lati']
	longi=request.form['longi']
	path="static/uploads/"+str(uuid.uuid4())+image.filename
	image.save(path)
	q="insert into images values(null,(select employee_id from employee where login_id='%s'),'%s',now())"%(lid,path)
	insert(q)
	q="insert into locations  values(null,(select employee_id from employee where login_id='%s'),'%s','%s',now())"%(lid,lati,longi)
	# print(q)
	insert(q)
	data['status']="success"
		
	data['method']="uploadfile"
	return demjson.encode(data)


@api.route('/markattendnace')
def markattendnace():
	data={}
	lid=request.args['lid']
	intime=request.args['intime']
	outtime=request.args['outtime']
	q="insert into attendances values(null,(select employee_id from employee where login_id='%s'),'%s','%s',curdate())"%(lid,intime,outtime)
	insert(q)
	data['status']="success"
		
	data['method']="markattendnace"
	return demjson.encode(data)