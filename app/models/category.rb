class Category < ActiveRecord::Base
  has_many :posts
  validates :title, presence: true, length: { maximum: 20 }
end
