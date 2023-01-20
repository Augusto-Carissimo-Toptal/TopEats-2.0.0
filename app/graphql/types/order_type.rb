module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :total_price, Float, null: false
    field :status, StatusType, null: false
    field :customer_id, Integer, null: false
    field :courier_id, Integer, null: false
    
  end
end

