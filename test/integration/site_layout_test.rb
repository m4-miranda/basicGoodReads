require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "navbar" do
    get user_home_path

    assert_select "nav"

  end
end
