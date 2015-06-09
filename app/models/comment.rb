class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :post
  belongs_to :comment
  has_many :comments, as: :commentable

  validates :body, presence: true, length: { maximum: 100 }
end
