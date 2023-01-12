class Vehicle < ApplicationRecord
  enum vehicle_type: { car: 'car', bicycle: 'bicycle', motorcycle: 'motorcycle' }

  belongs_to :courier
end
