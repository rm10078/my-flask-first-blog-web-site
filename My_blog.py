from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy 
import json
import os
from datetime import datetime
from werkzeug.utils import secure_filename  # this libarary for save file securely

with open('config.json','r') as c:  #all json variabel now store in params
    params= json.load(c)["params"]

app=Flask(__name__)

app.secret_key='supper_secret_key'  # this line for secret key
app.config['UPLOAD_FOLDER']=params['upload_lac']


# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://username:password@localhost/db_name'

local_server=params['local_server'] #this condition for connect data base
if(local_server): 
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_url']
    db = SQLAlchemy(app)

else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_url']
    db = SQLAlchemy(app) 

class Contact(db.Model):                                #this  class for connect database table
    sno = db.Column(db.Integer, primary_key=True)
    user_name = db.Column(db.String(80), unique=False, nullable=False)
    email = db.Column(db.String(120), unique=False, nullable=False)
    ph_no = db.Column(db.String(120), unique=False, nullable=False)
    mes = db.Column(db.String(120), unique=False, nullable=False)
    date = db.Column(db.String(20), unique=False, nullable=False)

class post(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), unique=False, nullable=False)
    slug = db.Column(db.String(50), unique=False, nullable=False)
    content = db.Column(db.String(500), unique=False, nullable=False)
    date = db.Column(db.String(20), unique=False, nullable=True)
    img_file = db.Column(db.String(20), unique=False, nullable=True)

@app.route('/')         
def home(): 
    posts=post.query.filter_by().all()[0:params['number_post']]                            #this is a function for home page
    return render_template('home.html',params=params,posts=posts) #params=params for acces json value

@app.route('/post/<string:post_slug>',methods=['GET'])      #<string:post_slug>  --- string: for accept any string and insert post_slug variable

def post_r(post_slug):          
    posts= post.query.filter_by(slug=post_slug).first()             # search slug and return the data



    return render_template('post.html',params=params,post=posts)

@app.route('/about')
def about():
    return render_template('about.html',params=params)

@app.route('/contact', methods=['GET', 'POST'])
def contacts():
    if(request.method=='POST'):
        #add entry to te data base
        name=request.form.get('username')
        emali=request.form.get('email')
        phone=request.form.get('phno')
        mes=request.form.get('mes')

        entry=Contact(user_name=name,email=emali,ph_no=phone,mes=mes,date=datetime.now())

        db.session.add(entry)    #this line for insert all data from data base
        db.session.commit()

    return render_template('contact.html',params=params)
@app.route('/next')         
def next(): 
    posts=post.query.filter_by().all()                           #this is a function for home page
    return render_template('next.html',params=params,posts=posts)
@app.route('/log_in',methods=['GET','POST'])
def log_in():
    if ('user' in session and session['user']==params['admin_username']):
        #this condition for if user loged in
        posts=post.query.filter_by().all()
        render_template('admin.html',params=params,posts=posts)
    if (request.method=='POST'):
        
        admin_name=request.form.get('username')
        admin_password=request.form.get('password')
        if(admin_name==params['admin_username'] and admin_password==params['admin_password']):
            #this condition for virify user
            #session variable
            
            session['user']=admin_name
            posts=post.query.filter_by().all()
            return render_template('admin.html',params=params,posts=posts)
    else:
        return render_template('log_in.html',params=params)
    return render_template('log_in.html',params=params)
@app.route('/edit/<string:sno>',methods=['GET','POST'])
def edit(sno):
    if ('user' in session and session['user']==params['admin_username']):
        if(request.method=='POST'):
            rq_title=request.form.get('title')
            rq_slug=request.form.get('slug')
            rq_content=request.form.get('content')
            rq_date=request.form.get('date')
            rq_img=request.form.get('img_file')
            
            if sno=='0':   #this condition for add new post
                pos=post(title=rq_title,slug=rq_slug,content=rq_content,date=rq_date,img_file=rq_img)
                db.session.add(pos)
                db.session.commit()
                print(pos)
            else:
                posts=post.query.filter_by(sno=sno).first()
                posts.title=rq_title
                posts.slug=rq_slug        #this else condition for edit text
                posts.date=rq_date
                posts.img_file=rq_img
                posts.content=rq_content
                db.session.commit()
                return redirect('/edit/'+sno)
        posts=post.query.filter_by(sno=sno).first()       
        return render_template('edit.html',params=params,posts=posts,sno=sno) 




                            #!!!!!!!!!!!!!!!!!!!
@app.route('/upload', methods=['GET', 'POST'])   #file upload have some problem 
def upload():
    if ('user' in session and session['user']==params['admin_username']):
        print('add ed')
        if(request.method=='POST'):
            f=request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename) ))
            return "upload done"           
    # return "upload done"
                            #!!!!!!!!!!!!!!!!!!!!!


@app.route('/logout')
def logout():  #function for logout 
    session.pop('user')     #for kill the session
    return redirect('/log_in')

@app.route('/delete/<string:sno>',methods=['GET','POST'])
def delete(sno):
    if ('user' in session and session['user']==params['admin_username']):
        posts=post.query.filter_by(sno=sno).first()
        db.session.delete(posts)
        db.session.commit()
    return redirect(log_in)






app.run(debug=True)