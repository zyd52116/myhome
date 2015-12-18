class ArticlesController < ApplicationController
	before_action :signed_in_user , only: [:new,:edit,:update,:create,:destroy]
	def index
		@articles = Article.order(created_at: :desc)
	end
		
	def show
		@article = Article.find(params[:id])
		@comment = @article.comments.build
		@comments = Comment.find_by(article_id: @article.id)
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
		redirect_to article_path
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
		redirect_to articles_path
	end
	
	
	def params_article
		params.require(:article).permit(:title,:content)
	end
	
	
	def signed_in_user
  	redirect_to new_admin_session_path unless signed_in?
  end
  
  #支持markdown
	 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception

 helper_method [:markdown]

 # Highlight code with Pygments
 class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
   language = "text" if language.blank?
   sha = Digest::SHA1.hexdigest(code)
   Rails.cache.fetch ["code", language, sha].join("-") do
    Pygments.highlight(code, :lexer => language)
   end
  end
 end

 protected

 # Markdown with Redcarpet
 def markdown(text)
  renderer = HTMLwithPygments.new({
   :filter_html => true,
   :hard_wrap => true,
   :link_attributes => {:rel => 'external nofollow'}
  })

  options = {
   :autolink => true,
   :no_intra_emphasis => true,
   :fenced_code_blocks => true,
   :lax_html_blocks => true,
   :strikethrough => true,
   :superscript => true,
   :tables => true
  }

  Redcarpet::Markdown.new(renderer, options).render(text).html_safe
 end

end
