# Creating seed admin user
user = User.new
user.email = 'sohaibmayo12@gmail.com'
user.password = 'Devsinc'
user.password_confirmation = 'Devsinc'
user.admin = true
user.save!

#Creating Seed Features
feature = Feature.new
feature.name = 'Free Salad'
feature.code = '0001'
feature.unit_price = 3
feature.max_unit_limit = 6
feature.save!

#Creating Seed Plan Including Above Features
plan = Plan.new
plan.name = 'Weekly Lunch'
plan.price = 30
plan.feature_ids = feature.id
plan.save
