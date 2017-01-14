class Report
    SummaryReport = Struct.new(:sum, :avg)

    def initialize(type:)
        @type = type
    end

    def generate(begin_range:, end_range:)
        case @type
        when "1"
            @result = Bill.where(:when_payed => begin_range..end_range)
        when "2"
            users_with_amount = Bill.group(:user).sum(:amount)
            @result = Hash.new

            if users_with_amount.any?
                sum_amount = users_with_amount.values.sum
                count_users = users_with_amount.count
                
                users_with_amount.map do |key, value|
                    @result[key] = SummaryReport.new(value, (sum_amount /count_users) - value)
                end
            end
        end
    end

    def self.all 
        [['Extract', 1], ['Summary', 2]]
    end

    attr_accessor :type, :result
end    