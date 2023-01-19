require_relative '../lib/populator_fix.rb'

1.upto(100) do |num|
  user = User.create!(
    full_name: Faker::Name.first_name, 
    phone_number: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email)

  address = Address.create!(
    address_field: Faker::Address.street_address)

  UserAddress.create!(
    user_id: user.id, 
    address_id: address.id)

  @menu_item = MenuItem.create!(name: Faker::Food.dish)

  if num.odd?
    @customer = Customer.create!(
      user_id: user.id)
  else
    courier = Courier.create!(
      user_id: user.id)

    Vehicle.create!(
      courier_id: courier.id, 
      vehicle_type: ['car', 'bicycle', 'motorcycle'].sample)

    order = Order.create!(
      status: ['pending', 'accepted', 'preparing', 'delivered'].sample,
      total_price: Faker::Number.decimal(l_digits: 2),
      courier_id: courier.id,
      customer_id: @customer.id
      )

    OrderMenu.create!(
      order_id: order.id,
      menu_item_id: @menu_item.id
    )
  end
end