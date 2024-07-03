module CourseModulesHelper
    def get_module_tests(m)
        return Test.where(course_module_id: m.id)
    end

    def get_module_score(m)
        module_tests = helpers.get_module_tests(m)
        total_score = 0
        module_tests.each do |t|
            total_score += helpers.get_test_score(t)
        end
    end
end
