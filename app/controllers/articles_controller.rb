class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    # get the article
    @article = Article.where(year:  params[:year]
                     ).where(month: params[:month]
                     ).where(day:   params[:day]
                     ).where(slug:  params[:slug]).first

    # no articles that match slug, go to /articles feed
    if @article.nil?
      return redirect_to articles_path
    end
  end
end
