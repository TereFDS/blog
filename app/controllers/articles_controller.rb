class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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
    authorize @article
    # if @article.user != current_user
    # redirect_to articles_path
    # end
    redirect_to new_user_session_path
  end

  def create
    return root_path unless user_signed_in?
    @article = Article.new(article_params.merge(user: current_user))
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if user_signed_in?
      @article = Article.find(params[:id])
      @article.delete
      redirect_to articles_path

    else
      redirect_to articles_path
    end
  end

  def last_articles_bymail
    # Agarrar ulimos articles
    # enviar email con esos articles
    # responder status: 200

    # el pluck es para obtener un atributo en particular
    articles = Article.last_created(params[:count]).pluck(:id)
    if user_signed_in?
      # Tell the ArticleMailer to send the email

      # el deliver_later es para hacerlo asincronico (mandar mail generalmente se hace asincronico)
      # si queremos que sea sincronico, hay que usar .deliver!
      ArticleMailer.last_created(current_user.email, articles, params[:count]).deliver_later

      # otra forma podria ser esta: tener una coleccion de articles y aplicar map a un atributo
      # (cualquiera de las dos formas son validas)
      # ArticleMailer.last_created(current_user.email, articles.map(&:id)).deliver_later
    end
    render nothing: true
  end

  private

  def article_params
    params.require(:article).permit([:title, :text])
  end
end
