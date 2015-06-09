class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments, as: :commentable

  attr_accessor :category_string

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true

  before_validation :set_category

  protected

  def set_category
    if self.category_string.nil?
      self.category = Category.find_or_create_by(title: "Misc")
    else
      self.category = Category.find_or_create_by(title: :category_string)
    end
  end
end
