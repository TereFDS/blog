class ArticleWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5 # Only five retries and then to the Dead Job Queue

  def perform(count_articles)
    Article.last_created(count)
  end
end
