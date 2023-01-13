class MenuItem < ApplicationRecord
  validates_presence_of :name

  has_many :order_menu
  has_many :orders, through: :order_menu
end
