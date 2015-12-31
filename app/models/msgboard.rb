class Msgboard < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	
	validates :content, presence: true ,length: { maximum:256}
end
