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

    test 'to_csv' do
    	assert_equal "external_id,email,name\ncus_KJQ4pzn6mz4o4F,imgei@gmail.com,Imge\n", Customer.to_csv
    end
end