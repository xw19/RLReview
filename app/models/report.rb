class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :reportable, polymorphic: true
  validates :reason, presence: true, length: { maximum: 200 }
end
