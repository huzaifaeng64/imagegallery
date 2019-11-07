class RegistrationsController < Devise::RegistrationsController

<<<<<<< HEAD
	# method for user to update email/username without password confirmation
	protected
  	def update_resource(resource, params)
    	if params[:password].blank? && params[:password_confirmation].blank?
      		resource.update_without_password(params)
    	else
     	super
    	end
  	end
=======
	protected
  def update_resource(resource, params)
      if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params)
    else
     super
    end

  end
>>>>>>> reaction-functionality

end
