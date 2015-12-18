class Comment < ActiveRecord::Base
	belongs_to :article
	default_scope -> { order('created_at') }
	validates :content, presence: true, length: { maximum: 512}
	validates :email ,presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :article_id, presence: true
end
