class MsgboardsController < ApplicationController
	before_action :signed_in_user ,only: [:destroy]
		
	def new
		@msgboard = Msgboard.new
		@msgboards = Msgboard.all
	end
	
	def create
		@msgboard = Msgboard.new(msgboard_params)
		if @msgboard.save
			redirect_to new_msgboard_path
		else
			redirect_to new_msgboard_path
		end
	end
	
	def destroy
		@msgboard = Msgboard.find(params[:id])
		@msgboard.destroy
	  redirect_to new_msgboard_path
	end
	
	private 
	
	def msgboard_params
		params.require(:msgboard).permit(:email,:content)
	end
	
	def signed_in_user
  	redirect_to new_admin_session_path unless signed_in?
  end
end
