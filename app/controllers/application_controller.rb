class ApplicationController < ActionController::Base
   def after_sign_in_path_for(resource)
        user_path(resource)
      end

      protect_from_forgery with: :exception
      before_action :configure_permitted_parameters, if: :devise_controller?
    
      protected
    
      def configure_permitted_parameters
        #strong parametersを設定し、usernameを許可
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:email,:password,:password_confirmation) }
        devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name,:email,:password,:password_confirmation) }
      end
end
