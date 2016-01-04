class CommentsController < ApplicationController
	before_action :signed_in_user ,only: [:destroy]
	def create
		@comment = Comment.create(comment_params)	
		@article = Article.find(@comment.article_id)
		respond_to do |format|
			if @comment.save
		 		#redirect_to article_path(@article)  改用ujs动态刷新
		 		format.html {}
		 		format.js
		 		#format.js	{ render :layout => false }
		 		#format.json { render :json => article_path(@article) }
			else
				#redirect_to article_path(@article)   改用ujs动态刷新
				format.html { render :new }
				
				#format.js { render :layout => false, :status => 406 }
				#format.json { render :json => {:error => @article.errors.full_messages.jion('.')} }	
			end			
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
