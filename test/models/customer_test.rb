require "test_helper"

class CustomerTest < ActiveSupport::TestCase
    test 'validations' do
        customer = Customer.new
  		assert_not customer.save

  		customer.name = 'imge'
  		assert_not customer.save

  		customer.email = 'imgei@gmail.com'
  		assert customer.save
    end
end