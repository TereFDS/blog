require 'rails_helper'

RSpec.describe Comment, :type => :model do
  before do
    @user = User.new
  end
  it { should validate_presence_of :body  }
  it { should validate_presence_of :user }
  it { should validate_presence_of :article }

#   it 'orders them in reverse chronologically' do
#      article = Article.create!(title: 'article 1', text: 'article 1 example test', user: @user)
#      comment1 = article.comments.create!(body: 'first comment')
#      comment2 = article.comments.create!(body: 'second comment')
#      expect(article.reload.comments).to eq([comment2, comment1])
#    end

  # it 'checks empty fields' do
  #  user = User.create!(email: 'user@name.com', password: 'password', password_confirmation: 'password')

  #  lindeman = Article.create!(first_name: 'Andy', last_name: 'Lindeman')
  #  chelimsky = Article.create!(first_name: 'David', last_name: 'Chelimsky')

  # expect(Article.ordered_by_last_name).to eq([chelimsky, lindeman])
  # end
end
