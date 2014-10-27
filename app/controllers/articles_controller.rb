class ArticlesController < ApplicationController
  def index
    @page_title = "Articles"

    @articles = Article.paginate(per_page: 5, page: params[:page])
    @articles = @articles.where(year:  params[:year])  if params[:year]
    @articles = @articles.where(month: params[:month]) if params[:month]
    @articles = @articles.where(day:   params[:day])   if params[:day]

    if @articles.length == 1
      return redirect_to @articles.first.path
    end
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
