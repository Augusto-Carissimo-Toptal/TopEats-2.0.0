class Address < ApplicationRecord
  validates_presence_of :address_field
  
  has_many :user_addresses
  has_many :users, through: :user_addresses
end
