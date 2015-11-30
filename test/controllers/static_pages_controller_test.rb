require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @base_title = " | 2015 Lit Project"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", full_title("Home")
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", full_title("About")
  end

  test "should get bibliography" do
    get :bibliography
    assert_response :success
    assert_select "title", full_title("Bibliography")
  end
  private
  def full_title(title)
    title + @base_title
  end
end
