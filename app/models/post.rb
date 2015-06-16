class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  acts_as_commentable

  paginates_per 5

  attr_accessor :category_string

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true

  before_validation :set_category

  protected

  def set_category
    if self.category_string.nil?
      self.category = Category.find_or_create_by(title: "Misc")
    else
      errors.add(:category_string, "Invalid category") unless (self.category = Category.find_or_create_by(title: self.category_string)).valid?
    end
  end
end
