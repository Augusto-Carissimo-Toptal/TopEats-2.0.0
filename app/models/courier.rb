class Courier < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :vehicles
end
