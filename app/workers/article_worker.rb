class ArticleWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5 # Only five retries and then to the Dead Job Queue

  def perform(count)
    Article.last_created(count)
  end
end
