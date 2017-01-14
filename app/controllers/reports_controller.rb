class ReportsController < ApplicationController
    def index
        @reports = Report.all
        @report_selected = "1"
        @begin_range = Date.today.at_beginning_of_month
        @end_range = Date.today.at_beginning_of_month.next_month
    end

    def show
        @report = Report.new(type: params[:report_type])
        @report.generate(
            begin_range: flatten_date_array(params[:begin_range]),
            end_range: flatten_date_array(params[:end_range]))
    end

    def flatten_date_array date_param
        if hash != nil 
            Date.new date_param["year"].to_i, date_param["month"].to_i, date_param["day"].to_i
        end
    end
end