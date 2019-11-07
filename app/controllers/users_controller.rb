class UsersController < ApplicationController
 
  load_and_authorize_resource
  before_filter :authenticate_user!

  def index
    @users = User.joins(:roles)
  end

  def show
  end

  def new_gallery
  end

  def new
    @user = User.new
  end

  def create_gallery
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to attachments_path, notice: 'Attachments was successfully updated.'}
        format.js
      else
        format.html { redirect_to attachments_path, alert: 'Attachments could not be added.'}
        format.js
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, {role_ids: []}, attachments_attributes: [:id, :title, :image_type, :description, :price, :created_by, :place, :user_id, :image_cache, :remote_image_url, :image, :images_cache, :remove_image, :amount])
  end


end
