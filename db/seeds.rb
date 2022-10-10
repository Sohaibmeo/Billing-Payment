# frozen_string_literal: true

# Creating seed admin user
user = User.new
user.email = 'sohaibmayo12@gmail.com'
user.password = 'Devsinc'
user.password_confirmation = 'Devsinc'
user.admin = true
user.save!
# Creating dummy user 1
user = User.new
user.email = 'f180166@nu.edu.pk'
user.password = 'Devsinc'
user.password_confirmation = 'Devsinc'
user.admin = false
user.save!
# Creating dummy user 2
user = User.new
user.email = 'sohaib.mmeo@devsinc.com'
user.password = 'Devsinc'
user.password_confirmation = 'Devsinc'
user.admin = false
user.save!

# Creating Seed Feature 1
feature1 = Feature.new
feature1.name = 'Free Salad'
feature1.code = '0001'
feature1.unit_price = 3
feature1.max_unit_limit = 6
feature1.save!
# Creating Seed Feature 2
feature2 = Feature.new
feature2.name = 'Free Drinks'
feature2.code = '0002'
feature2.unit_price = 15
feature2.max_unit_limit = 12
feature2.save!
# Creating Seed Feature 3
feature3 = Feature.new
feature3.name = 'Buy One Get One'
feature3.code = '0003'
feature3.unit_price = 5
feature3.max_unit_limit = 10
feature3.save!

# Creating Seed Plan Including Some Features
plan = Plan.new
plan.name = 'Weekly Lunch'
plan.price = 30
plan.feature_ids = feature1.id
plan.save
# Creating Seed Plan Including Some Features
plan = Plan.new
plan.name = 'Serve My Like King Kong'
plan.price = 125
plan.feature_ids = feature2.id, feature3.id
plan.save
