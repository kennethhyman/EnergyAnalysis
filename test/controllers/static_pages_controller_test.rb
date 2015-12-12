require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @base_title = "2015 Lit Project"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", full_title
  end

  test "should get future study" do
    get :future_study
    assert_response :success
    assert_select "title", full_title("Future Study")
  end

  test "should get bibliography" do
    get :bibliography
    assert_response :success
    assert_select "title", full_title("Bibliography")
  end
  private
  def full_title(title = '')
    if title.empty?
      @base_title
    else
      title + " | " + @base_title
    end
  end
end
