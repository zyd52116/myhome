class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		 if @comment.save
				redirect_to articles_path
			else
				redirect_to articles_path
			end
	end
	
	def destroy
		@comment = Coment.find(params[:id])
		if @comment.destoy
			redirect_to articles_path
		else
			redirect_to articles_path
	end
	private 
	def comment_params
		params.require(:comment).permit(:email,:content,:article_id)
	end
end
