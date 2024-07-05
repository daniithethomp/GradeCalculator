module TestsHelper
    def get_test_score_weighted(t)
        unless t.earned_score.nil?
            return (get_test_score(t) * t.weight / 100).round(2)
        else
            return 0
        end
    end

    def get_test_score(t)
        unless t.earned_score.nil?
            return (t.earned_score / t.max_score * 100).round(2)
        else
            return 0
        end
    end
end
