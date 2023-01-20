module Mutations
  class CreateUser < BaseMutation
    # arguments passed to the `resolve` method
    argument :full_name, String, required: true
    argument :phone_number, String, required: true
    argument :email, String, required: true

    # return type from the mutation
    type Types::UserType

    def resolve(full_name: nil, phone_number: nil, email: nil)
      User.create!(
        full_name: full_name,
        phone_number: phone_number,
        email: email
      )
      rescue ActiveRecord::RecordInvalid => e 
        GraphQL::ExecutionError.new('whatever')
    end
  end
end