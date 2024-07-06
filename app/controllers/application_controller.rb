class ApplicationController < ActionController::Base
    layout :layout_by_action


    before_action :configure_permitted_parameters, if: :devise_controller?

    # rescue_from CanCan::AccessDenied do |exception|
    #     exception.default_message = "You are not authorized to perform this task"
    #     respond_to do |format|
    #         format.json { head :forbidden }
    #         format.html { redirect_to root_path, alert: exception.message }
    #     end
    # end

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:target_score, :email, :password, :current_password)}
         end
    private 
    def layout_by_action
        if devise_controller?
            if (resource_name == :user && action_name == "new" || action_name == "create") || (resource_name == :session && action_name == "new")
                "landing_page"
            else
                "application"
            end
        else
            "application"
        end
    end
end
