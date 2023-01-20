module Types
  class QueryType < Types::BaseObject

    field :all_users, [UserType], null: false
    field :all_orders, [OrderType], null: false
    field :all_customers, [CustomerType], null: false

    field :search_users, [UserType], null: false do
      argument :id, String, required: false
    end
    

    def all_users
      User.all
    end

    def all_orders
      Order.all
    end

    def all_customers
      Customer.all
    end

    def search_users(id:)
      User.where(id: id).limit(10)
    end
  end
end
