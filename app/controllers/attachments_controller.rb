class AttachmentsController < ApplicationController
<<<<<<< HEAD

	load_and_authorize_resource
	before_filter :authenticate_user!, except: [:all_attachments, :show, :show_gallery]

	def index
	end

	def like
		respond_to do |format|
			if @attachment.already_reacted(@attachment, current_user)
				@reaction = Reaction.where(user_id: current_user.id, attachment_id: @attachment.id)
				if @reaction.update(user: current_user, attachment: @attachment, status: params[:status], reaction: params[:reaction])
					format.html { redirect_back fallback_location: all_attachments_path, notice: 'you liked an attachment.'}
       				format.js
       			else
       				format.html { redirect_back fallback_location: all_attachments_path, alert: 'An error preventing you from liking this attachment.' }
       				format.js
       			end
			else
				@reaction = Reaction.create(user: current_user, attachment: @attachment, status: params[:status], reaction: params[:reaction])
     			if @reaction.save
        			format.html { redirect_back fallback_location: all_attachments_path, notice: 'you liked an attachment.'}
       				format.js
      			else
       				format.html { redirect_back fallback_location: all_attachments_path, alert: 'An error preventing you from liking this attachment.' }
       				format.js
      			end
    		end
    	end
	end

	def dislike
		respond_to do |format|
			if @attachment.already_reacted(@attachment, current_user)
				@reaction = Reaction.where(user_id: current_user.id, attachment_id: @attachment.id)
				if @reaction.update(user: current_user, attachment: @attachment, status: params[:status], reaction: params[:reaction])
					format.html { redirect_back fallback_location: all_attachments_path, notice: 'you disliked an attachment.'}
       				format.js
       			else
       				format.html { redirect_back fallback_location: all_attachments_path, alert: 'An error preventing you from disliking this attachment.' }
       				format.js
       			end
       		else
				@reaction = Reaction.create(user: current_user, attachment: @attachment, status: params[:status], reaction: params[:reaction])
	     		if @reaction.save
	      			# TODO: Move hardcode flash message into language file
	        		format.html { redirect_back fallback_location: all_attachments_path, notice: 'you disliked an attachment.'}
	       			format.js
	    		else
	       			format.html { redirect_back fallback_location: all_attachments_path, alert: 'An error preventing you from disliking this attachment.' }
	       			format.js
	      		end
	      	end
    	end
=======
load_and_authorize_resource
before_filter :authenticate_user!, except: [:all_attachments, :show]

	def index
		@attachments = current_user.attachments
>>>>>>> reaction-functionality
	end

	def all_attachments
		@users = User.all
<<<<<<< HEAD
		@attachments = Attachment.left_outer_joins(:reactions).group(:id).order("count(*) desc")
	end

	def show_gallery
		@user = current_user
		@user_id = Attachment.select(:user_id).where(id: params[:id])
		@attachments = Attachment.where(user_id: @user_id)
=======
	end

	def gallery
		@user = Attachment.select(:user_id).where(id: params[:id])
		@attachments = Attachment.where(user_id: @user)
>>>>>>> reaction-functionality
	end

	def show
		@attachment = Attachment.find(params[:id])
	end

	def new
		@attachment = Attachment.new
	end

	def edit
		@attachment = Attachment.find(params[:id])
	end

	def create
		@attachment = current_user.attachments.create(attachment_params)
		respond_to do |format|
<<<<<<< HEAD
      		if @attachment.save
        		# TODO: Move hardcode flash message into language file
        		format.html { redirect_to attachment_path(@attachment), notice: 'Attachment was successfully added.'}
      		else
        		format.html { render :new, alert: 'Attachments could not be added.' }
      		end
=======
      	if @attachment.save
        # TODO: Move hardcode flash message into language file
        	format.html { redirect_to user_create_gallery_path(current_user), notice: 'Attachment was successfully added.'}
      	else
        	format.html { redirect_to user_create_gallery_path(current_user), alert: 'Attachments could not be added.' }
      	end
>>>>>>> reaction-functionality
    	end
	end

	def update
		@attachment = Attachment.find(params[:id])
		respond_to do |format|
		if @attachment.update(attachment_params)
        # TODO: Move hardcode flash message into language file
        	format.html { redirect_to attachment_path(@attachment), notice: 'Attachment was successfully updated.'}
      	else
        	format.html { render :edit, alert: 'Attachments could not be updated.' }
      	end
    	end
	end

	def destroy
		@attachment = current_user.attachments.find(params[:id])
		@attachment.destroy

		redirect_to attachments_path
	end

	private def attachment_params
<<<<<<< HEAD
		params.require(:attachment).permit(:title, :image_type, :description, :price, :created_by, :place, :user_id, :image_cache, :remote_image_url, :image, :images_cache, :remove_image, :amount)
=======
		params.require(:attachment).permit(:title, :image_type, :description, :price, :created_by, :place, :user_id, :image_cache, :remote_image_url, :image, :images_cache, :remove_image)
>>>>>>> reaction-functionality
	end


end
