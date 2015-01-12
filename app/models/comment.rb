class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :user, presence: true
  validates :article, presence: true
  belongs_to :article
  belongs_to :user
end
