module Types
  class StatusType < Types::BaseEnum
    value 'pending'
    value 'accepted'
    value 'preparing'
    value 'delivered'
  end
end
