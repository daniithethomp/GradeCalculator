module ApplicationHelper

    def get_score_colour(score)
        if score >= current_user.target_score
            return "green"
        elsif score >= current_user.target_score - 10
            return "orange"
        else
            return "red"
        end
    end
end
