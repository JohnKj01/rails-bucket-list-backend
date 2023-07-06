puts "🌱 Seeding Lists..."
# Seed your database here
travel = Category.create(name: "travel")
lifestyle = Category.create(name: "lifestyle")
experience = Category.create(name: "experience")

user1 = User.create(name: "John Doe", email: "john@example.com", password: "password")
user2 = User.create(name: "Jane Smith", email: "jane@example.com", password: "password")
user3 = User.create(name: "Mike Johnson", email: "mike@example.com", password: "password")

Item.create(name: "Travel to Amalfi Coast, Italy", completed: false, category: travel, user_id: user1.id)
Item.create(name: "Travel to Santorini, Greece", completed: false, category: travel, user_id: user1.id)
Item.create(name: "Road trip on The Wild Atlantic Way, Ireland's coastal route", completed: false, category: travel, user_id: user2.id)
Item.create(name: "Visit the Yellowstone National Park", completed: false, category: travel, user_id: user2.id)
Item.create(name: "Visit the Glacier national park", completed: false, category: travel, user_id: user3.id)
Item.create(name: "Visit Alaska to see Northern lights", completed: false, category: travel, user_id: user3.id)

Item.create(name: "Meal prep every Sunday", completed: false, category: lifestyle, user_id: user1.id)
Item.create(name: "Go to the gym and lift heavy 3 times a week", completed: false, category: lifestyle, user_id: user1.id)
Item.create(name: "Yoga and stretching twice a week", completed: false, category: lifestyle, user_id: user2.id)
Item.create(name: "Learn a new language", completed: false, category: lifestyle, user_id: user2.id)
Item.create(name: "Talk to parents once a week", completed: false, category: lifestyle, user_id: user3.id)
Item.create(name: "Read 1 book a month", completed: false, category: lifestyle, user_id: user3.id)

# Item.create(name: "Go to pottery class", completed: false, category: experience, user_id: user1.id)
# Item.create(name: "Try Curling", completed: false, category: experience, user_id: user1.id)
# Item.create(name: "Bungee jumping", completed: false, category: experience, user_id: user2.id)
# Item.create(name: "Try white water rafting", completed: false, category: experience, user_id: user2.id)
# Item.create(name: "See a live musical", completed: false, category: experience, user_id: user3.id)
# Item.create(name: "Learn how to make Cannoli", completed: false, category: experience, user_id: user3.id)

puts "✅ Done seeding!"
