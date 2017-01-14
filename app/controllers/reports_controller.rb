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
            begin_range: ApplicationHelper.param_to_date(params[:begin_range]),
            end_range: ApplicationHelper.param_to_date(params[:end_range]))
    end
end