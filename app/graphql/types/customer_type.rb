module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null:false
    # field :user_info, [UserType], null:false, method: user_infoq
    field :orders, [OrderType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
