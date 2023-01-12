class User < ApplicationRecord
  validates_presence_of :full_name
  validates_length_of :full_name, maximum: 250, on: :create
  validates_presence_of :phone_number
  validates_format_of :phone_number, with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
  message: "- Phone numbers must be in xxx-xxx-xxxx format."
  validates_presence_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  has_one :customer
  has_one :courier
  has_one :user_address
  has_one :address, through: :user_address
end
