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
description = Faker::Lorem.paragraph(sentence_count: 3)

if User.count == 0 # if User table is empty 
    User.create! name: "admin", email: "admin@admin.com", password: "password"
    puts "created admin"
    10.times do
        name = Faker::Name.name
        email = Faker::Internet.safe_email(name: name)
        password = "password"
        User.create! name: name, email: email, password: password
    end
    puts "Created users"
end

features = %w[Organic Gluten-free Non-GMO Vegan Vegetarian]


if Feature.count == 0 # if Category table is empty 
    features.each do |feature|
        Feature.create(name: feature)
        puts "Feature #{feature} created"
    end
    puts "Created features"
end

categories = %w[Vegetables Fruit Confectionery Dairy Poultry Meat]

if Category.count == 0 # if Category table is empty 
    categories.each do |category|
        Category.create(name: category)
        puts "Category #{category} created"
    end
end

if Listing.count == 0 # if Listing table is empty
    # Create fruits
    5.times do
        id = 1
        listing = Listing.create! name: Faker::Food.fruits, price: Faker::Number.between(from: 1000, to: 10000), category_id: 2, user_id: id, description: description, username: User.find(id).name, date_created: (DateTime.now - (rand * 21))
        listing.image.attach(io: File.open('app/assets/images/food-categories/fruit.jpeg'), filename: 'fruit.jpeg')
        listing.save!

        rand(1..5).times do
            listing.features << Feature.all.sample
        end
        puts "Created #{listing.features}"
    end
        puts "Created fruits" 

        # Create vegetables 
    5.times do
        id = 1
        listing = Listing.create! name: Faker::Food.vegetables, price: Faker::Number.between(from: 1000, to: 10000), category_id: 1, user_id: Faker::Number.between(from: 1, to: 11), description: description, username: User.find(id).name, date_created: (DateTime.now - (rand * 21))
        listing.image.attach(io: File.open('app/assets/images/food-categories/vegetables.jpeg'), filename: 'vegetables.jpeg')
        listing.save!

        rand(1..5).times do
            listing.features << Feature.all.sample
            # # listing.features.uniq!
        end
        puts "Created #{listing.features}"
    end
        puts "Created vegetables" 

    # Create confectionery
    5.times do
        id = 1
        listing = Listing.create! name: Faker::Dessert.variety, price: Faker::Number.between(from: 1000, to: 10000), category_id: 3, user_id: Faker::Number.between(from: 1, to: 11), description: description, username: User.find(id).name, date_created: (DateTime.now - (rand * 21))
        listing.image.attach(io: File.open('app/assets/images/food-categories/confectionery.jpeg'), filename: 'confectionery.jpeg')
        listing.save!

        rand(1..5).times do
            listing.features << Feature.all.sample
            # listing.features.uniq!
        end
        puts "Created #{listing.features}"
    end
        puts "Created confectionery" 

    # Create meat 
    meats.each do |meat|
        id = 1
        listing = Listing.create! name: meat, price: Faker::Number.between(from: 1000, to: 10000), category_id: 6, user_id: Faker::Number.between(from: 1, to: 11), description: description, username: User.find(id).name, date_created: (DateTime.now - (rand * 21))
        listing.image.attach(io: File.open('app/assets/images/food-categories/meat.webp'), filename: 'meat.webp')
        listing.save!



        rand(1..5).times do
            listing.features << Feature.all.sample
            # listing.features.uniq!
        end
        puts "Created #{listing.features}"
        
    end
    puts "Created meat" 
        
    # Create poultry
    poultries.each do |poultry|
        id = 1
        listing = Listing.create! name: poultry, price: Faker::Number.between(from: 1000, to: 10000), category_id: 5, user_id: Faker::Number.between(from: 1, to: 11), description: description, username: User.find(id).name, date_created: (DateTime.now - (rand * 21))
        listing.image.attach(io: File.open('app/assets/images/food-categories/poultry.jpeg'), filename: 'poultry.jpeg')
        listing.save!

        rand(1..5).times do
            listing.features << Feature.all.sample
            # listing.features.uniq!
        end
        puts "Created #{listing.features}"
    end
    puts "Created poultry" 

    # Create dairy
    dairies.each do |dairy|
        id = 1
        listing = Listing.create! name: dairy, price: Faker::Number.between(from: 1000, to: 10000), category_id: 4, user_id: Faker::Number.between(from: 1, to: 11), description: description, username: User.find(id).name, date_created: (DateTime.now - (rand * 21))
        listing.image.attach(io: File.open('app/assets/images/food-categories/dairy.jpeg'), filename: 'dairy.jpeg')
        listing.save!

        rand(1..5).times do
            listing.features << Feature.all.sample
            # listing.features.uniq!
        end
        puts "Created #{listing.features}"
    end
    puts "Created dairy" 

    Listing.all

end 