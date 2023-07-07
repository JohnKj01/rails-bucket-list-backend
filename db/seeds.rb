puts "🌱 Seeding Lists..."

# Seed your database here
travel = Category.create(name: "travel")
lifestyle = Category.create(name: "lifestyle")
experience = Category.create(name: "experience")

user1 = User.create(name: "John Doe", email: "john@example.com", password: "password")
user2 = User.create(name: "Jane Smith", email: "jane@example.com", password: "password")
user3 = User.create(name: "Mike Johnson", email: "mike@example.com", password: "password")

Item.create(name: "Travel to Amalfi Coast, Italy", completed: false, completed_by: Date.new(2023, 12, 31), category: travel, user_id: user1.id)
Item.create(name: "Travel to Santorini, Greece", completed: true, completed_by: Date.new(2023, 9, 30), category: travel, user_id: user1.id)
Item.create(name: "Road trip on The Wild Atlantic Way, Ireland's coastal route", completed: false, completed_by: Date.new(2023, 11, 30), category: travel, user_id: user2.id)
Item.create(name: "Visit the Yellowstone National Park", completed: false, completed_by: Date.new(2024, 1, 31), category: travel, user_id: user2.id)
Item.create(name: "Visit the Glacier national park", completed: true, completed_by: Date.new(2023, 10, 31), category: travel, user_id: user3.id)
Item.create(name: "Visit Alaska to see Northern lights", completed: false, completed_by: Date.new(2023, 12, 31), category: travel, user_id: user3.id)

Item.create(name: "Meal prep every Sunday", completed: false, completed_by: Date.new(2023, 9, 30), category: lifestyle, user_id: user1.id)
Item.create(name: "Go to the gym and lift heavy 3 times a week", completed: true, completed_by: Date.new(2023, 12, 31), category: lifestyle, user_id: user1.id)
Item.create(name: "Yoga and stretching twice a week", completed: false, completed_by: Date.new(2023, 10, 31), category: lifestyle, user_id: user2.id)
Item.create(name: "Learn a new language", completed: false, completed_by: Date.new(2023, 11, 30), category: lifestyle, user_id: user2.id)
Item.create(name: "Talk to parents once a week", completed: true, completed_by: Date.new(2023, 12, 31), category: lifestyle, user_id: user3.id)
Item.create(name: "Read 1 book a month", completed: false, completed_by: Date.new(2023, 9, 30), category: lifestyle, user_id: user3.id)

Item.create(name: "Go to pottery class", completed: false, completed_by: Date.new(2023, 10, 31), category: experience, user_id: user1.id)
Item.create(name: "Try Curling", completed: true, completed_by: Date.new(2023, 12, 31), category: experience, user_id: user1.id)
Item.create(name: "Bungee jumping", completed: false, completed_by: Date.new(2023, 11, 30), category: experience, user_id: user2.id)
Item.create(name: "Try white water rafting", completed: false, completed_by: Date.new(2023, 12, 31), category: experience, user_id: user2.id)
Item.create(name: "See a live musical", completed: true, completed_by: Date.new(2023, 9, 30), category: experience, user_id: user3.id)
Item.create(name: "Learn how to make Cannoli", completed: false, completed_by: Date.new(2023, 10, 31), category: experience, user_id: user3.id)

puts "✅ Done seeding!"
