class Photo < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
end
