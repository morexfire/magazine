class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @slug = "article"

    # temp just for placedholder during development
    @people = Person.all

    # get the article
    @article = Article.where(year:  params[:year]
                     ).where(month: params[:month]
                     ).where(day:   params[:day]
                     ).where(slug:  params[:slug]).first

    # no articles that match slug, go to /articles feed
    if @article.nil?
      return redirect_to articles_path
    else
      @title = @article.name
    end
  end
end
