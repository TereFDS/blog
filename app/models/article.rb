class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }

  def self.last_created(count)
    Article.order(:created_at).limit(count)
  end

end
