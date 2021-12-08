# # # This file should contain all the record creation needed to seed the database with its default values.
# # # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# # #
# # # Examples:
# # #
# # #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# # #   Character.create(name: 'Luke', movie: movies.first)

meats = %w[Lamb Beef Pork Goat Fish]
poultries = %w[Chicken Turkey Duck Guineafowl Quail]
dairies = %w[Butter Eggs Milk Cheese Yoghurt]

if User.count == 0 # if User table is empty 
    10.times do
        name = Faker::Name.name
        email = Faker::Internet.safe_email(name: name)
        password = "password"
        User.create! name: name, email: email, password: password
    end
    puts "Created users"
end

if Listing.count == 0 # if Listing table is empty
    # Create fruits
    5.times do
        Listing.create! name: Faker::Food.fruits, price: Faker::Number.between(from: 1000, to: 10000), category: 'Fruit', user_id: Faker::Number.between(from: 1, to: 10), description: Faker::Lorem.paragraph(sentence_count: 2)
    end
        puts "Created fruits" 

        # Create vegetables 
    5.times do
        Listing.create! name: Faker::Food.vegetables, price: Faker::Number.between(from: 1000, to: 10000), category: 'Vegetables', user_id: Faker::Number.between(from: 1, to: 10), description: Faker::Lorem.paragraph(sentence_count: 2)
    end
        puts "Created vegetables" 

    # Create confectionery
    5.times do
        Listing.create! name: Faker::Dessert.variety, price: Faker::Number.between(from: 1000, to: 10000), category: 'Confectionery', user_id: Faker::Number.between(from: 1, to: 10), description: Faker::Lorem.paragraph(sentence_count: 2)
    end
        puts "Created confectionery" 

    # Create meat 
    meats.each do |meat|
        Listing.create! name: meat, price: Faker::Number.between(from: 1000, to: 10000), category: 'Meat', user_id: Faker::Number.between(from: 1, to: 10), description: Faker::Lorem.paragraph(sentence_count: 2)
        
    end
    puts "Created meat" 
        
    # Create poultry
    poultries.each do |poultry|
        Listing.create! name: poultry, price: Faker::Number.between(from: 1000, to: 10000), category: 'Poultry', user_id: Faker::Number.between(from: 1, to: 10), description: Faker::Lorem.paragraph(sentence_count: 2) 
    end
    puts "Created poultry" 

    # Create dairy
    dairies.each do |dairy|
        Listing.create! name: dairy, price: Faker::Number.between(from: 1000, to: 10000), category: 'dairy', user_id: Faker::Number.between(from: 1, to: 10), description: Faker::Lorem.paragraph(sentence_count: 2) 
    end
    puts "Created dairy" 

end 