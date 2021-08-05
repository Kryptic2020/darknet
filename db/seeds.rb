# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email:"aquenzitech@gmail.com", password:"asdasd", username:"Aquenzitech")

categories = Category.create([{name:"Electronic"},{name:"Hobbies"},{name:"Camping"},{name:"Sports"},{name:"General"},{name:"Services"},{name:"Vehicle"},{name:"Books"},{name:"Clothing"}])

condition = Condition.create([{name:"Brand New"},{name:"Second Hand"}])

status = Status.create([{name:"Open"}, {name:"Processed"}])

