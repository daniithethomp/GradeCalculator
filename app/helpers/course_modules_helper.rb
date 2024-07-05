module CourseModulesHelper
    def get_module_tests(m)
        return Test.where(course_module_id: m.id)
    end

    def get_module_score(m)
        module_tests = get_module_tests(m)
        total_score = 0
        passed = true
        has_thresholds = false
        module_tests.each do |t|
            if t.is_threshold
                has_thresholds = true
                unless t.pass
                    passed = false
                end
            else
                total_score += get_test_score_weighted(t)
            end
        end
        total_score += 40 if passed && has_thresholds
        return passed ? total_score : 0
    end
end
