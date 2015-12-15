class Admin::DashboardController < ApplicationController
  layout 'layouts/admin'
  before_action :signed_in_user
  
  def index
  
  end
  
  def signed_in_user
  	redirect_to new_admin_session_path unless signed_in?
  end
end
