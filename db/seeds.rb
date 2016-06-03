# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Supply.create(name: "Twin Bedframe")
Supply.create(name: "Twin Mattress", new: true )
Supply.create(name: "Couch")
Supply.create(name: "Kitchen Table")
Supply.create(name: "Kitchen Chair")
Supply.create(name: "Dresser")
Supply.create(name: "Silverware Set")
Supply.create(name: "Large Pot")
Supply.create(name: "Small Pot")
Supply.create(name: "Kettle", required: false)
Supply.create(name: "Crib")
