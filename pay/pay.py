from flask import Flask, request, render_template, jsonify, json, url_for
from flaskext.mysql import MySQL
import pymysql
import datetime
from flask_bcrypt import Bcrypt
import hashlib
import sql as sql
import paypalrestsdk


mysql = MySQL()
app = Flask(__name__)
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'yudz123456'
app.config['MYSQL_DATABASE_DB'] = 'test4'
app.config['MYSQL_DATABASE_HOST'] = '127.0.0.1'
mysql.init_app(app)

## invoice table with click to pay button
@app.route('/', methods = ['POST', 'GET'])
def chooseToPay():
    error = None
    cursor = mysql.connect().cursor()
    cursor.execute(
        "SELECT invoice_id, date, amount FROM ltd_invoice")
    result = cursor.fetchall()
    if request.method == 'POST':
        return render_template('chooseToPay.html',error = error,result = result)
    return render_template('chooseToPay.html',error = error,result = result)

## paypal part
@app.route('/pay/', methods = ['POST', 'GET'])
def pay():
    return render_template('pay.html')
paypalrestsdk.configure({
  "mode": "sandbox", # sandbox or live
  "client_id": "AWn4oS0kQGU5y-n3WmtKm20pc12MWRPjTZvwM9siM9DJLowgCMEx1EqFO3J4lqhK6JYGwcvrgl_lTDAb",
  "client_secret": "EAdv-llysc-Be99ylVIw1Y9xSs6ng4BSb5HcIZeT-vr6UuLvbb_OmhrpuuWQPgSOVT5WddBh7u47CKpQ" })

## paypal pay
@app.route('/pay/payment', methods=['POST'])
def payment():

    payment = paypalrestsdk.Payment({
        "intent": "sale",
        "payer": {
            "payment_method": "paypal"},
        "redirect_urls": {
            "return_url": "http://localhost:3000/payment/execute",
            "cancel_url": "http://localhost:3000/"},
        "transactions": [{
            "item_list": {
                "items": [{
                    "name": "testitem",
                    "sku": "12345",
                    "price": "60.00",
                    "currency": "USD",
                    "quantity": 1}]},
            "amount": {
                "total": "60.00",
                "currency": "USD"},
            "description": "This is the payment transaction description."}]})

    if payment.create():
        print('Payment success!')
        
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute(
        " INSERT into ltd_payment(payment_date, payment_status, payment_type, card_no, invoice_id)values(curdate(), %s, %s, %s, %s)",( 'approved', 'credit card', '4418348269066883', '1'))
        conn.commit()
        print('added')
    else:
        print(payment.error)

    return jsonify({'paymentID' : payment.id})
    # return render_template('payment.html')
    
## paypal excute
@app.route('/pay/execute', methods=['POST'])
def execute():
    success = False

    payment = paypalrestsdk.Payment.find(request.form['paymentID'])

    if payment.execute({'payer_id' : request.form['payerID']}):
        print('Execute success!')
        success = True
    else:
        print(payment.error)

    return jsonify({'success' : success})


#payment success if use card typing
@app.route('/success')
def success():
    return render_template('success.html')

# show payemt table records
@app.route('/paymentShows')
def check_record():
    return render_template('payment.html')


@app.route("/paymentShow", methods=["POST", "GET"])
def paymentShow():
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        if request.method == 'POST':
            draw = request.form['draw']
            row = int(request.form['start'])
            rowperpage = int(request.form['length'])
            searchValue = request.form["search[value]"]
            sortColumn = request.form["columns[" + request.form["order[0][column]"] + "][name]"]
            sortColumnDirection = request.form["order[0][dir]"]
            print(draw)
            print(row)
            print(rowperpage)
            print(searchValue)
            print("sortcol: "+sortColumn)
            print("sortdir: " + sortColumnDirection)

            ## Total number of records without filtering
            cursor.execute(
                "SELECT count(*) AS allrecord "
                +"FROM ltd_payment ")
            rsallrecord = cursor.fetchone()
            totalRecords = rsallrecord['allrecord']
            print(totalRecords)

            ## Total number of records with filtering
            likeString = "%" + searchValue + "%"
            cursor.execute(
                "SELECT count(*) AS allrecord FROM ltd_payment WHERE payment_id LIKE %s OR payment_date LIKE %s OR payment_status LIKE %s OR payment_type LIKE %s OR card_no LIKE %s",
                (likeString, likeString, likeString, likeString, likeString))
            rsallrecord = cursor.fetchone()
            totalRecordwithFilter = rsallrecord['allrecord']
            print(totalRecordwithFilter)

            ## Fetch records
            if searchValue == '':
                cursor.execute(
                    "SELECT * from ltd_payment ORDER BY payment_id limit %s, %s;", 
                    (row, rowperpage))
                recordlist = cursor.fetchall()
            else:
                cursor.execute(
                     "SELECT count(*) AS allrecord FROM ltd_payment WHERE payment_id LIKE %s OR payment_date LIKE %s OR payment_status LIKE %s OR payment_type LIKE %s OR card_no LIKE %s;",
                    (likeString, likeString, likeString, likeString, likeString, row, rowperpage))
                recordlist = cursor.fetchall()

            data = []
            for row in recordlist:
                
                data.append({
                    'payment_id': row['payment_id'],
                    'payment_date': row['payment_date'],
                    'payment_status': row['payment_status'],
                    'payment_type': row['payment_type'],
                    'card_no': row['card_no'],
                })

            response = {
                'draw': draw,
                'iTotalRecords': totalRecords,
                'iTotalDisplayRecords': totalRecordwithFilter,
                'aaData': data,
            }
            return jsonify(response)

    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

if __name__ == '__main__':
    app.debug = True
    app.run()
