class Comment < ActiveRecord::Base
  paginates_per 5
  belongs_to :commentable, polymorphic: true
  belongs_to :post
  belongs_to :comment
  has_many :comments, as: :commentable

  validates :body, presence: true, length: { maximum: 1000 }
end
