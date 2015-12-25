class CommentsController < ApplicationController
	before_action :signed_in_user ,only: [:destroy]
	def create
		@comment = Comment.create(comment_params)	
		@article = Article.find(@comment.article_id)
		 if @comment.save
				redirect_to article_path(@article)
			else
				redirect_to article_path(@article)
			end
	end
	
	def destroy
		@comment = Comment.find(params[:id])
		@article = Article.find(@comment.article_id)		
		if @comment.destroy
			redirect_to article_path(@article)
		else
			redirect_to article_path(@article)
		end
	end
	private 
	def comment_params
		params.require(:comment).permit(:email,:content,:article_id)
	end
	
	def signed_in_user
  	redirect_to new_admin_session_path unless signed_in?
  end
end
