require 'rails_helper'

RSpec.describe CustomersController, type: :request do
  let!(:customer) { 
    Customer.create!(
    full_name: "Homer Simpson", 
    email: "Homer.Simpson@example.com", 
    phone_number: 1112223333)
  }
  let!(:address) { Address.create!( address_field: "742 Evergreen Terrace")}
  let!(:user_address) { UserAddress.create(user_id: customer.id, address_id: address.id)}

  let!(:new_attributes) {
    {full_name: 'new user', phone_number: '9999999999', email: 'destroy@toptal.com'}
  }
  let!(:invalid_attributes) {
    {full_name: '', email:  '', phone_number: ''}
    }

  context 'testing customers_path' do
    it 'returns all customers' do
      get customers_path
      expect(JSON.parse(response.body).size).to eq(1)
    end
    
    it 'returns status code 200' do
      get customers_path
      expect(response).to have_http_status(:success)
    end

    it 'returns customer\'s full_name' do
      get customers_path
      expect(JSON.parse(response.body)[0]['full_name']).to eq('Homer Simpson')
    end

    it 'returns customer\'s email' do
      get customers_path
      expect(JSON.parse(response.body)[0]['email']).to eq('Homer.Simpson@example.com')
    end

    it 'returns customer\'s phone_number' do
        get customers_path
        expect(JSON.parse(response.body)[0]['phone_number']).to eq(1112223333)
    end

    it 'returns customer\'s address' do
      get customers_path
      expect(JSON.parse(response.body)[0]['address']['address_field']).to eq('742 Evergreen Terrace')
    end

    it 'returns customer\'s orders' do
      get customers_path
      expect(JSON.parse(response.body)[0]['orders']).to eq()
    end
  end

  context "GET /index" do
    it "renders a successful response" do
      get customers_url
      expect(response).to be_successful
    end
  end

  context "GET /show" do
    it "renders a successful response" do
      get customer_url(customer)
      expect(response).to be_successful
    end
  end

  context "POST /create" do
    context "with valid parameters" do

      it "creates a new Customer" do
        post customers_url, params: { customer: new_attributes }
        expect((response.body).size).to eq(1)
      end
    

      it "success status" do
        post customers_url, params: { customer: new_attributes }
        expect(response).to have_http_status(:success)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Customer" do
        expect {
          post customers_url, params: { customer: invalid_attributes }
        }.to change(Customer, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post customers_url, params: { customer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested customer" do
        patch customer_url(customer), params: { customer: new_attributes }
        customer.reload
        expect(response).to have_http_status(:success)
      end
    end
    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch customer_url(customer), params: { customer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end
  
  describe "DELETE /destroy" do
    it "destroys the requested customer" do
      expect {
        delete customer_url(customer)
      }.to change(Customer, :count).by(-1)
    end

    it "redirects to the customers list" do
      delete customer_url(customer)
      expect(response).to have_http_status(:success)
    end
  end
end