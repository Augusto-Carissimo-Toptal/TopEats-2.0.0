module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :total_price, Float, null: false
    field :status, StatusType, null: false
    field :customer_id, Integer, null: false
    field :courier_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

