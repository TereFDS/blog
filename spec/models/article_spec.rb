require "rails_helper"

RSpec.describe Article, :type => :model do

  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_least(5) }
  it { should validate_presence_of :text  }
  it { should validate_length_of(:text).is_at_least(10)  }
  it { should validate_presence_of :user }


  #it "check empty fields" do
  #  user = User.create!(email: "user@name.com", password: 'password', password_confirmation: 'password')

  #  lindeman = Article.create!(first_name: "Andy", last_name: "Lindeman")
  #  chelimsky = Article.create!(first_name: "David", last_name: "Chelimsky")

  # expect(Article.ordered_by_last_name).to eq([chelimsky, lindeman])
  #end
end
