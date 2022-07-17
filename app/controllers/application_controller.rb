class ApplicationController < ActionController::Base
    #before action runs the method defined below if on a Devise controller. 
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
   
    #Method to allow username field we added to signup form to be permitted into the database. User controller will inherit this. 
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
