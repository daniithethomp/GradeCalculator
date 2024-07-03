module TestsHelper
    def get_test_score(t)
        unless t.earned_score.nil?
            return t.earned_score / t.max_score * 100
        else
            return 0
        end
    end
end
