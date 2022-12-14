from flask import Flask
from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


sellers = Blueprint ("sellers", __name__)

@sellers.route ('/sellers')
def get_sellers():
    cursor = db.get_db().cursor()
    select = 'SELECT * FROM sellers'
    cursor.execute(select)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@sellers.route ('/sellers/<id>', methods = ['GET'])
def get_sellers_detail(id):
    cursor = db.get_db().cursor()
    select_stmt = 'SELECT * FROM sellers where sellerID = {0}'.format(id)
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

@sellers.route ('/sellers/form', methods = ['POST'])
def add_sellers():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    sellerID = request.form ['sellerID']
    first_name = request.form ['first_name']
    last_name = request.form['last_name']
    business_name = request.form['business_name']
    business_age = request.form['business_age']
    reviewID = request.form['reviewID']
    priceID = request.form['priceID']
    shipID = request.form['shipID']
    invoiceID = request.form['invoiceID']
    currency = request.form['currency']
    styleID = request.form['styleID']
    ratingID = request.form['ratingID']
    priorityID = request.form['priorityID']
    query = f'INSERT INTO sellers (sellerID, first_name, last_name, business_name, business_age, reviewID, priceID, shipID, invoiceID, currency, styleID, ratingID, priorityID) VALUES (\"{sellerID}\", \"{first_name}\", \"{last_name}\", \"{business_name}\", \"{business_age}\", \"{reviewID}\", \"{priceID}\", \"{shipID}\", \"{invoiceID}\", \"{currency}\", \"{styleID}\", \"{ratingID}\", \"{priorityID}\")'
    cursor.execute(query)
    db.get_db().commit()
    return 'Success'