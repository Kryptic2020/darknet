# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email:"alex@test.com", password:"asdasd")

user_info = UserContactInfo.create(street_number: 41, unit: "H", street_name: "Gotha", suburb: "Fortitude Valley", phone: "0411 312 092", postcode: "4006")

categories = Category.create([{name:"Electronic"},{name:"Music"},{name:"Services"},{name:"Vehicle"}])

condition = Condition.create([{name:"New"},{name:"Used"}])

status = Status.create([{name:"Open"}, {name:"Close"}])
#payment = Payment.create(payment_intent_id:"shadjsdhad", receipt_url:"hjsjadhasjkd")
product = Product.create(title:"Phone",description:"Iphone X",price:900,shipped_from:"Sydney",delivery_estimated:14,quantity_available:300,user_id:1,category_id:1,condition_id:1)
