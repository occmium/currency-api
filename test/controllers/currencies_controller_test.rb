require 'test_helper'

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  test "method 'GET/currencies' should be closed" do
    get currencies_url
    assert_response 401
  end

  test "method 'GET/currencies/:id' should be closed" do
    get currencies_url(api_keys(:one))
    assert_response 401
  end

end
