require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should show extract report" do
    post "/reports", params: { report_type: "1", begin_range: {"year" => 2017, "month" => 1, "day" => 1}, end_range: {"year" => 2017, "month" => 2, "day" => 1}}

    assert_response :success
  end

  test "should show summary report" do
    post "/reports", params: { report_type: "2", begin_range: {"year" => 2017, "month" => 1, "day" => 1}, end_range: {"year" => 2017, "month" => 2, "day" => 1}}

    assert_response :success
  end

end
