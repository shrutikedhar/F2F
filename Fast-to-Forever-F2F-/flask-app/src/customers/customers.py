from flask import Flask
from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


customers = Blueprint ("customers", __name__)

@customers.route ('/customers')
def get_customers():
    return '<h1> Imagine a list of students here <h1>'

@customers.route ('/customer', methods = ['POST'])
def add_customers():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    customerID = request.form ['customerID']
    first_name = request.form ['first_name']
    last_name = request.form ['last_name']
    age = request.form ['age']
    gender = request.form ['gender']
    email = request.form ['email']
    shipID = request.form ['shipID']
    budgetID = request.form ['budgetID']
    storeID = request.form ['storeID']
    priorityID = request.form ['priorityID']
    query = f'INSERT INTO f2f_db.customer(customerID, first_name, last_name, age, gender, email, shipID, budgetID, storeID, priorityID) VALUES (\"{customerID}\", \"{first_name}\", \"{last_name}\", \"{age}\", \"{gender}\"), \"{email}\", \"{shipID}\", \"{budgetID}\", \"{storeID}\", \"{priorityID}\"'
    cursor.execute(query)
    return 'Success'

@customers.route ('/customers/<id>', methods = ['GET'])
def get_customers_detail(id):
    cursor = db.get_db().cursor()
    select_stmt = 'SELECT * FROM customer where customerID = {0}'.format(id)
    cursor.execute(select_stmt)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response