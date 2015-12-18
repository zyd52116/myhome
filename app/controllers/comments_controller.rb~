class CommentsController < ApplicationController
	def create
		@comment = Comment.create(comment_params)
		 if @comment.save
				redirect_to articles_path
			else
				redirect_to articles_path
			end
	end
	
	def destroy
		@comment = Comment.find(params[:id])
		if @comment.destroy
			redirect_to articles_path
		else
			redirect_to articles_path
		end
	end
	private 
	def comment_params
		params.require(:comment).permit(:email,:content,:article_id)
	end
end
