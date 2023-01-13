require_relative '../lib/populator_fix.rb'

User.populate 100 do |u|
  u.full_name = Faker::Name.first_name
  u.phone_number = Faker::Alphanumeric.alpha(number: 10)
  u.email = Faker::Internet.email
  address = Address.create(address_field: Faker::Address.street_address)
  UserAddress.populate 1 do |i|
    i.user_id = u.id, 
    i.address_id = address.id
  end
end

(1...100).each do |i|
  if i.odd?
    Customer.create!(user_id: i)
  else
    courier = Courier.create!(user_id: i)
    # Vehicle.populate 1 do |u|
    #   u.courier_id = courier.id, 
    #   u.vehicle_type = ['car', 'bicycle', 'motorcycle'].sample
    # end
  end
end

Order.populate 100 do |u|
  (1...100).each do |i|
    u.status = ['pending', 'accepted', 'preparing', 'delivered' ].sample, 
    u.total_price = Faker::Number.decimal(l_digits: 2), 
    u.customer_id = i, 
    u.courier_id = i 
  end
end

# MenuItem.populate 100 do |u|
#   u.name = Faker::Food.dish
# end

# Order.populate 25 do |u|
#   u.status = 'pending'
#   u.total_price = Faker::Number.decimal(l_digits: 2)
#   u.courier_id = rand(1...25)
#   u.customer_id = rand(1...25)
# end

# Order.populate 25 do |u|
#   u.status = 'accepted'
#   u.total_price = Faker::Number.decimal(l_digits: 2)
#   u.courier_id = rand(26...50)
#   u.customer_id = rand(26...50)
# end

# Order.populate 25 do |u|
#   u.status = 'preparing'
#   u.total_price = Faker::Number.decimal(l_digits: 2)
#   u.courier_id = rand(51...75)
#   u.customer_id = rand(51...75)
# end

# Order.populate 25 do |u|
#   u.status = 'delivered'
#   u.total_price = Faker::Number.decimal(l_digits: 2)
#   u.courier_id = rand(76...100)
#   u.customer_id = rand(76...100)
# end



