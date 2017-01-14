require 'test_helper'

class BillTest < ActiveSupport::TestCase
  test "should generate extract report" do
    date_begin = Date.new(2017, 1, 1) 
    date_end =  Date.new(2017, 3, 1)

    result = Report.new(type: "1").generate(begin_range: date_begin, end_range: date_end)
    expect = Bill.where(:when_payed => date_begin..date_end)
    
    assert result.first == expect.first
    assert result.last == expect.last
    assert result.count == expect.count
  end

  test "should generate summary report" do
    date_begin = Date.new(2017, 1, 1) 
    date_end =  Date.new(2017, 3, 1)

    result = Report.new(type: "2").generate(begin_range: date_begin, end_range: date_end)

    assert result.to_a[0][0].name == "Lucas"
    assert result.to_a[0][1].avg == 5
    assert result.to_a[0][1].sum == 10

    assert result.to_a[1][0].name == "Valdir"
    assert result.to_a[1][1].avg == -5
    assert result.to_a[1][1].sum == 20
  end
end