class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :text, presence: true
  validates :user, presence: true

  def self.last_created(count)
    Article.order(:created_at).limit(count)
  end

end
