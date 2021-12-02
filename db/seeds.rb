# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = %w[vegetables fruits confectionery dairy poultry meat]

if Category.count == 0 # if Category table is empty 
    categories.each do |category|
        Category.create(name: category)
        puts "Category #{category} created"
    end
end

if User.count == 0 # if User table is empty 
    User.create(email: "test@email.com", password: "password")
    puts "Created user"
end
