class ArticlesController < ApplicationController
	before_action :signed_in_user , only: [:new,:edit,:update,:create,:destroy]
	def index
		@articles = Article.all
	end
		
	def show
		@article = Article.find(params[:id])
	end 
	
	def new
		@article = Article.new
	end
	def edit
	  @article = Article.find(params[:id])
	end 
	
	def update
		@article = Article.find(params[:id])
		@article.update(params_article)
		redirect_to articles_path
	end
	
	def create
		@article = Article.new(params_article)
		if @article.save
			
		   redirect_to articles_path	   
		else

		  render action: "new"
		end
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
	end
	
	
	def params_article
		params.require(:article).permit(:title,:content)
	end
	
	def signed_in_user
  	redirect_to new_admin_session_path unless signed_in?
  end
end
