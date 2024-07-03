module YearsHelper
    def get_year_modules(year)
        return CourseModule.where(year_id: year.id)
    end

    def get_total_year_credits(year)
        total_credits = 0
        get_year_modules(year).each do |m|
            total_credits += m.credits
        end
        return total_credits
    end
end
