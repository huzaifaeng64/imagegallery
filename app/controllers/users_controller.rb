class UsersController < ApplicationController
<<<<<<< HEAD
 
  load_and_authorize_resource
  before_filter :authenticate_user!
=======
 load_and_authorize_resource
 before_filter :authenticate_user!
>>>>>>> reaction-functionality

  def index
    @users = User.joins(:roles)
  end

  def show
<<<<<<< HEAD
    @user = current_user
=======
    @user = User.find(params[:id])
>>>>>>> reaction-functionality
  end

  def new_gallery
    @user = current_user
  end

  def new
    @user = User.new
  end

<<<<<<< HEAD
  def create_gallery
    @user = current_user
    respond_to do |format|
     if @user.update(user_params)
       # TODO: Move hardcode flash message into language file
       format.html { redirect_to attachments_path, notice: 'Attachments was successfully updated.'}
       format.js
     else
       format.html { redirect_to attachments_path, alert: 'Attachments could not be added.'}
       format.js
=======
  def edit
    @user = User.find(params[:id])
  end

  def create_gallery
    @user = current_user
    @user = User.find(params[:user_id])
    respond_to do |format|
     if @user.update(user_params)
       # TODO: Move hardcode flash message into language file
       format.html { redirect_to user_new_gallery_path(current_user), notice: 'Attachments was successfully updated.'}
     else
       format.html { redirect_to user_new_gallery_path(current_user), alert: 'Attachments could not be added.'}
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        # TODO: Move hardcode flash message into language file
        format.html { redirect_to @user, notice: 'user was successfully updated.'}
      else
        format.html { render :edit, alert: 'user could not be updated.'}
>>>>>>> reaction-functionality
      end
    end
  end

  private
  def user_params
<<<<<<< HEAD
    params.require(:user).permit(:username, :email, {role_ids: []}, attachments_attributes: [:id, :title, :image_type, :description, :price, :created_by, :place, :user_id, :image_cache, :remote_image_url, :image, :images_cache, :remove_image, :amount])
=======
    params.require(:user).permit(:username, :email, {role_ids: []}, attachments_attributes: [:id, :title, :image_type, :description, :price, :created_by, :place, :user_id, :image_cache, :remote_image_url, :image, :images_cache, :remove_image])
>>>>>>> reaction-functionality
  end


end
