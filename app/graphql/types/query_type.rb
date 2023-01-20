module Types
  class QueryType < Types::BaseObject

    field :all_users, [UserType], null: false
    field :all_orders, [OrderType], null: false
    field :all_customers, [CustomerType], null: false

    def all_users
      User.all
    end

    def all_orders
      Order.all
    end

    def all_customers
      Customer.all
    end
  end
end
