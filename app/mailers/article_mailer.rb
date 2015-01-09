class ArticleMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def last_created(email,articles)
    @articles = Article.find(articles)
    @email = email
    @url  = 'http://example.com/login'
    mail(to: @email, subject: 'Last Created Articles')

  end
end
