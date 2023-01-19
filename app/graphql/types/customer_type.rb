# frozen_string_literal: true

module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :full_name, String, null: false
    field :phone_number, String, null: false
    field :email, String, null: false
  end
end
