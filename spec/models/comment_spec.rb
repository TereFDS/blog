require "rails_helper"

RSpec.describe Comment, :type => :model do
  before do
    @user = User.new
    @comment = Comment.new
  end
  it { should validate_presence_of :body  }
  it { should validate_presence_of :user }
  it { should validate_presence_of :article }

  #it "checks empty fields" do
  #  user = User.create!(email: "user@name.com", password: 'password', password_confirmation: 'password')

  #  lindeman = Article.create!(first_name: "Andy", last_name: "Lindeman")
  #  chelimsky = Article.create!(first_name: "David", last_name: "Chelimsky")

  # expect(Article.ordered_by_last_name).to eq([chelimsky, lindeman])
  #end
end
