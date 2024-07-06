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

    def get_year_score(year)
        total_score = 0
        total_credits = get_total_year_credits(year)
        modules = get_year_modules(year)
        modules.each do |m|
            score = get_module_score(m)
            total_score += score * (m.credits.to_f / total_credits.to_f)
        end
        return total_score
    end
end
