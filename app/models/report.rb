class Report

    attr_accessor :type, :result
    SummaryReport = Struct.new(:sum, :avg)

    def initialize(type:)
        @type = type
    end

    def generate(begin_range:, end_range:)
        case @type
        when "1"
            @result = generate_extract_report(begin_range, end_range)
        when "2"
            @result = generate_summary_report(begin_range, end_range)
        end
    end

    def self.all 
        [['Extract', 1], ['Summary', 2]]
    end

    private

    def generate_extract_report(begin_range, end_range)
        Bill.where(:when_payed => begin_range..end_range)
    end

    def generate_summary_report(begin_range, end_range)
        users_with_amount = Bill.group(:user).sum(:amount)
        result = Hash.new

        if users_with_amount.any?
            sum_amount = users_with_amount.values.sum
            count_users = users_with_amount.count
            
            users_with_amount.map do |key, value|
                result[key] = SummaryReport.new(value, (sum_amount /count_users) - value)
            end
        end

        result
    end
end    