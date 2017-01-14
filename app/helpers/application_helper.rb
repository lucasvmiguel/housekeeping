module ApplicationHelper
    def self.param_to_date date_param
        Date.new date_param["year"].to_i, date_param["month"].to_i, date_param["day"].to_i
    end
end
