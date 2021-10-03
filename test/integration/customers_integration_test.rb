require "test_helper"

class CustomersIntegrationTest < ActionDispatch::IntegrationTest
    test 'index' do
    	assert_equal 1, Customer.count
    	get customers_path
    	assert_response :success	
    	assert_equal 100, Customer.count
    end

    test 'download' do
    	get download_customers_path
    	assert_equal 'text/csv', response.headers['Content-Type']
    	assert_includes response.headers['Content-Disposition'], "customers-2021-10-03.csv"
    end
end