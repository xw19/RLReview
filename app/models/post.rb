class Post < ActiveRecord::Base
  belongs_to :category

  attr_accessor :category_string

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true

  before_validation :set_category

  protected

  def set_category
    self.category = Category.find_or_create_by(title: :category_string)
  end
end
