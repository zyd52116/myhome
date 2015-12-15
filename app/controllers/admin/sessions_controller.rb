class Admin::SessionsController < ApplicationController
  layout 'layouts/admin'
  
  def new
  	if signed_in?
  		redirect_to admin_root_path
  	end
  end
  
  def create
  	user = User.find_by(name: params[:session][:name])
  	if user && user.authenticate(params[:session][:password])
  	 	sign_in user
  	  redirect_to admin_root_path
  	else
  	  render 'new'
  	end
  end
  
  def destroy
  	sign_out
  	redirect_to new_admin_session_path
  end
  
end
