class Attachment < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates_presence_of :name
  validates_presence_of :file

  scope :visible, lambda {where(:visible => true)}
  scope :invisible, lambda {where(:visible => false)}
  scope :newest_first, lambda {order(:created_at => :desc)}
  scope :popular_first, lambda {order(:download_count => :desc)}
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end
