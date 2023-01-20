module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null:false
    # field :user_info, [UserType], null:false, method: user_infoq
    field :orders, [OrderType], null: false
  end
end
