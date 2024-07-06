class ApplicationController < ActionController::Base
    layout :layout_by_action

    private 
    def layout_by_action
        if devise_controller?
            if resource_name == :user && action_name == "edit"
                "application"
            else
                "landing_page"
            end
        else
            "application"
        end
    end
end
