class PhotosController < ApplicationController
before_action :signed_in_user ,only: [:destroy,:new,:create]
	def index
		@photos = Photo.all
	end
	
	def new
		@photo = Photo.new
	end 
	
	def show
		@photo = Photo.find_by(params[:id])
	end
	
	def create
		@photo = Photo.new(params_photo)
		if @photo.save
			redirect_to photos_path
		else
			redirect_to photos_path
		end
	end
	
	def destroy
		@photo = Photo.find_by(params[:id])
		if @photo.destroy
			redirect_to photos_path
		else
			redirect_to photos_path
		end
	end
	
	def params_photo
		params.require(:photo).permit(:kinds,:avatar)
	end
	
	def signed_in_user
  	redirect_to new_admin_session_path unless signed_in?
  end
	
end
