import hashlib
from flask import Flask,render_template,request,redirect,flash

from flask import Flask,request,render_template
from flaskext.mysql import MySQL

mysql = MySQL()
app = Flask(__name__)
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'leonloveyou'
app.config['MYSQL_DATABASE_DB'] = 'DB'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
app.config["TEMPLATES_AUTO_RELOAD"] = True
app.secret_key = "super secret key"
GlobalEmail = " "
GlobalNumber = 0

@app.route('/')
def login():
    ##run for only one time then comment out

    # conn = mysql.connect()
    # cursor = conn.cursor()
    # cursor.execute('select email from ltd_customer')
    # email = cursor.fetchall()
    # # range is number of customer
    # for x in range(29):
    #     password = "qwer123" + str(x)
    #     m = hashlib.md5()
    #     m.update(password.encode(encoding='utf-8'))
    #     password = m.hexdigest()
    #     cursor.execute('Insert into ltd_customer_pass values(%s, %s)', (email[x], password))
    #     conn.commit()
    #
    # employeeEmail = ['employee1@gmail.com', 'employee2@gmail.com', 'employee3@gmail.com']
    # conn = mysql.connect()
    # cursor = conn.cursor()
    # # range is number of employee
    # for x in range(3):
    #     password = "asdf123" + str(x)
    #     m = hashlib.md5()
    #     m.update(password.encode(encoding='utf-8'))
    #     password = m.hexdigest()
    #     cursor.execute('Insert into ltd_employee_pass values(%s, %s)', (employeeEmail[x], password))
    #     conn.commit()



    return render_template('login.html')

@app.route('/customerOP')
def customerOP():
    return render_template('customerOP.html')

@app.route('/employeeOP')
def employeeOP():
    return render_template('employeeOp.html')

@app.route('/customer', methods = ['POST', 'GET'])
def customer():
    if request.method == 'POST':
        email = request.form['email']
        global GlobalEmail
        GlobalEmail = email
        password = request.form['password']
        m = hashlib.md5()
        m.update(password.encode(encoding='utf-8'))
        password = m.hexdigest()
        cursor = mysql.connect().cursor()
        cursor.execute("SELECT email FROM ltd_customer_pass s WHERE s.email ='" + email + "' AND s.pass= '" + password + "'")
        data = cursor.fetchone()
        if data is None:
            flash(u'Invalid email or password provided', 'error')
        else:
            return render_template('customerOP.html')
    return render_template('customer.html')


@app.route('/employee', methods = ['POST', 'GET'])
def employee():
    if request.method == 'POST':
        email = request.form['email']
        global GlobalEmail
        GlobalEmail = email
        password = request.form['password']
        m = hashlib.md5()
        m.update(password.encode(encoding='utf-8'))
        password = m.hexdigest()
        cursor = mysql.connect().cursor()
        cursor.execute("SELECT * FROM ltd_employee_pass s WHERE s.email ='" + email + "' AND s.pass= '" + password + "'")
        data = cursor.fetchone()
        if data is None:
            flash(u'Invalid email or password provided', 'error')
        else:
            return render_template('employeeOp.html')
    return render_template('employee.html')

@app.route('/customer_info', methods = ['POST', 'GET'])
def customer_info():
    error = None
    cursor = mysql.connect().cursor()
    cursor.execute("select customer_type from ltd_customer where email = '" + GlobalEmail + "'")
    cursor.execute(
        "SELECT * FROM ltd_rent_record s WHERE s.email = '" + GlobalEmail + "'")
    result = cursor.fetchall()
    return render_template('customer_info.html',error = error, result = result)



@app.route('/changePass', methods = ['POST', 'GET'])
def changePass():
    error = None
    cursor = mysql.connect().cursor()
    cursor.execute("select customer_type from ltd_customer where email = '" + GlobalEmail + "'")
    type = cursor.fetchone()
    print(type[0][0])
    if type[0][0] == 'i':
        cursor.execute(
            "SELECT c.email, c.phone, c.street, c.city, c.state, c.zip, i.insurance_no FROM ltd_customer c, ltd_indi_cus i WHERE c.Email = '" + GlobalEmail + "' AND c.email = i.email")
        result = cursor.fetchall()
    else:
        cursor.execute(
            "SELECT c.email, c.phone, c.street, c.city, c.state, c.zip, i.corp_name FROM ltd_customer c, ltd_corp_cus i WHERE c.Email = '" + GlobalEmail + "' AND c.email = i.email")
        result = cursor.fetchall()
    if request.method == 'POST':
        conn = mysql.connect()
        old = request.form['old']
        first = request.form['first']
        NewPassword = request.form['password']

        m1 = hashlib.md5()
        m1.update(old.encode(encoding='utf-8'))
        old = m1.hexdigest()
        cursor1 = mysql.connect().cursor()
        cursor1.execute(
            "SELECT * FROM ltd_customer_pass s WHERE s.Email ='" + GlobalEmail + "' AND s.pass= '" + old + "'")
        data1 = cursor1.fetchone()

        if (data1):
            if(first == NewPassword):
                m = hashlib.md5()
                m.update(NewPassword.encode(encoding='utf-8'))
                NewPassword = m.hexdigest()
                if NewPassword:
                    cursor3 = conn.cursor()
                    cursor3.execute(
                        "UPDATE ltd_customer_pass s SET s.pass = '" + NewPassword + "'WHERE s.Email = '" + GlobalEmail + "'")
                    conn.commit()
                    flash(u'password changed !', 'error')
                    render_template('changePass.html',value = result)
            else:
                flash(u'please check your new password are typed twice correctly!', 'error')
                render_template('changePass.html', value = result)
        else:
            flash(u'please check your original password !', 'error')
            render_template('changePass.html', value = result)

    return render_template('changePass.html', error=error, result = result)

@app.route('/employeeChangePassword', methods = ['POST', 'GET'])
def employeeChangePassword():
    if request.method == 'POST':
        conn = mysql.connect()
        old = request.form['old']
        first = request.form['first']
        NewPassword = request.form['password']


        m1 = hashlib.md5()
        m1.update(old.encode(encoding='utf-8'))
        old = m1.hexdigest()
        print(GlobalEmail)
        cursor2 = mysql.connect().cursor()
        cursor2.execute(
            "SELECT * FROM ltd_employee_pass s WHERE s.email ='" + GlobalEmail + "' AND s.pass= '" + old + "'")
        data2 = cursor2.fetchone()

        if data2:
            if(first == NewPassword):
                m = hashlib.md5()
                m.update(NewPassword.encode(encoding='utf-8'))
                NewPassword = m.hexdigest()
                if NewPassword:
                    cursor3 = conn.cursor()
                    cursor3.execute(
                        "UPDATE ltd_employee_pass s SET s.pass = '" + NewPassword + "'WHERE s.Email = '" + GlobalEmail + "'")
                    conn.commit()
                    flash('password changed', 'error')
                    render_template('employeeChangePassword.html')
            else:
                flash(u'please check your new password are typed twice correctly!', 'error')
                render_template('employeeChangePassword.html')
        else:
            flash(u'please check your original password !', 'error')
            render_template('employeeChangePassword.html')

    return render_template('employeeChangePassword.html', error = None)




@app.route('/registerIndi', methods = ['POST', 'GET'])
def registerIndi():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        phone = request.form['phone']
        street = request.form['street']
        city = request.form['city']
        state = request.form['state']
        zip = request.form['zip']
        type = request.form['type']
        licenseId = request.form['license']
        fn = request.form['firstName']
        ln = request.form['lastName']
        insuranceName = request.form['insuranceName']
        insuranceId = request.form['insuranceId']

        m = hashlib.md5()
        m.update(password.encode(encoding='utf-8'))
        password = m.hexdigest()

        conn = mysql.connect()
        cursor4 = conn.cursor()
        cursor4.execute("select * from ltd_customer where email = '" + email + "'")
        valid = cursor4.fetchone()
        if not valid and (type == 'i' or type == 'c'):
            cursor4.execute('INSERT INTO ltd_customer_pass VALUES(%s,%s)', (email, password))
            cursor4.execute('INSERT INTO ltd_customer (email, phone, street, city, state, zip, customer_type) VALUES (%s,%s,%s,%s,%s,%s,%s)', (email, phone, street, city, state, zip, type))
            cursor4.execute('INSERT INTO ltd_indi_cus (email,license_id,cus_fn,cus_ln, insurance_name, insurance_no) VALUES (%s,%s,%s,%s,%s,%s)',(email, licenseId, fn, ln, insuranceName, insuranceId))
            conn.commit()
            flash('Customer registerd', 'error')
            render_template('registerIndi.html')
        else:
            flash('Customer alread exist or type error', 'error')
            render_template('registerIndi.html')
    return render_template('registerIndi.html')

@app.route('/UpdateIndi',methods = ['POST', 'GET'])
def UpdateIndi():
    if request.method == 'POST':
        email = request.form['email']
        phone = request.form['phone']
        street = request.form['street']
        city = request.form['city']
        state = request.form['state']
        zip = request.form['zip']
        type = request.form['type']
        fn = request.form['firstName']
        ln = request.form['lastName']
        insuranceName = request.form['insuranceName']
        insuranceId = request.form['insuranceId']

        conn = mysql.connect()
        cursor4 = conn.cursor()
        cursor4.execute("select email from ltd_indi_cus where email = '" + email + "'")
        valid = cursor4.fetchone()
        if not valid:
            flash('Customer not exist', 'error')
            render_template('UpdateIndi.html')
        else:
            cursor4.execute("update ltd_customer set phone = '" + phone + "',street = '" + street + "',city = '" + city + "',state = '" + state + "',zip = '" + zip + "',customer_type = '" + type + "' where email = '" + email + "'")
            cursor4.execute("update ltd_indi_cus set cus_fn = '" + fn + "',cus_ln = '" + ln + "',insurance_name = '" + insuranceName + "',insurance_no = '" + insuranceId + "'where email = '" + email + "'")
        conn.commit()
        flash('Updated', 'error')
        render_template('UpdateIndi.html')
    return render_template('UpdateIndi.html')

@app.route('/register_customer', methods = ['POST', 'GET'])
def register_customer():
    return render_template('registerOp.html')

@app.route('/update_customer', methods = ['POST', 'GET'])
def update_customer():
    return render_template('UpdateOP.html')


@app.route('/registerCorp', methods = ['POST', 'GET'])
def registerCorp():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        phone = request.form['phone']
        street = request.form['street']
        city = request.form['city']
        state = request.form['state']
        zip = request.form['zip']
        type = request.form['type']
        corpNum = request.form['corpNum']
        empId = request.form['empId']
        corpName = request.form['corpName']
        corpCoupon = request.form['corpCoupon']

        m = hashlib.md5()
        m.update(password.encode(encoding='utf-8'))
        password = m.hexdigest()


        conn = mysql.connect()
        cursor4 = conn.cursor()
        cursor4.execute("select email from ltd_corp_cus where email = '" + email + "'")
        valid = cursor4.fetchone()
        if not valid and (type == 'i' or type == 'c'):
            cursor4.execute('INSERT INTO ltd_customer (email, phone, street, city, state, zip, customer_type) VALUES (%s,%s,%s,%s,%s,%s,%s)', (email, phone, street, city, state, zip, type))
            cursor4.execute('INSERT INTO ltd_corp_cus (email, corp_no, emp_id, corp_name, corp_coupon_id) VALUES (%s,%s,%s,%s,%s)',(email, corpNum, empId, corpName, corpCoupon))
            conn.commit()
            flash('customer added', 'error')
            render_template('registerCorp.html')
        else:
            flash('Customer alread exist or type error', 'error')
            render_template('registerCorp.html')
    return render_template('registerCorp.html')


@app.route('/UpdateCorp',methods = ['POST', 'GET'])
def UpdateCorp():
    if request.method == 'POST':
        email = request.form['email']
        phone = request.form['phone']
        street = request.form['street']
        city = request.form['city']
        state = request.form['state']
        zip = request.form['zip']
        type = request.form['type']

        corpNum = request.form['corpNum']
        empId = request.form['empId']
        corpName = request.form['corpName']
        corpCoupon = request.form['corpCoupon']

        conn = mysql.connect()
        cursor4 = conn.cursor()
        cursor4.execute("select email from ltd_corp_cus where email = '" + email + "'")
        valid = cursor4.fetchone()
        if not valid:
            flash('Customer not exist', 'error')
            render_template('UpdateCorp.html')
        else:
            cursor4.execute("update ltd_customer set phone = '" + phone + "',street = '" + street + "',city = '" + city + "',state = '" + state + "',zip = '" + zip + "',customer_type = '" + type + "' where email = '" + email + "'")
            cursor4.execute("update ltd_corp_cus set corp_no = '" + corpNum + "',emp_id = '" + empId + "',corp_name = '" + corpName + "',corp_coupon_id = '" + corpCoupon + "'where email = '" + email + "'")
        conn.commit()
        flash('Updated', 'error')
        render_template('UpdateCorp.html')
    return render_template('UpdateCorp.html')

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    app.run()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
