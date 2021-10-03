require "test_helper"

class CustomersIntegrationTest < ActionDispatch::IntegrationTest
    test 'index' do
    	assert_equal 1, Customer.count
    	assert_difference('Customer.count', 99) do
    		get customers_path
    		assert_response :success	
    	end
    	# assert_equal 100, Customer.count
    end

    test 'download' do
    	get download_customers_path
    	assert_response :success	
    	header = response.headers
    	assert_equal 'text/csv', header['Content-Type']
    	assert_includes header['Content-Disposition'], "customers-#{Date.today}.csv"
    end
end