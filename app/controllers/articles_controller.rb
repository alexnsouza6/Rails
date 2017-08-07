class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def create
		#render plain: params[:article].inspect -> To verify if the database is reading the values correctly
		@article = Article.new(articles_params)
		@article.save
		redirect_to articles_show(@article)
	end

	

	private

		def article_params
			params.require(:article).permit(:title, :description)
		end
end