class ApplicationController < ActionController::Base
    before_action :configure_permitted_paramters, if: :devise_controller?

    protected

        def configure_permitted_paramters
            devise_paramter_sanitizer.permit(:sign_up, keys: [:name])
            
        end
end
