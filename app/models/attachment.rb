class Attachment < ApplicationRecord
  belongs_to :user
  has_many_attached :buckets

  validates_presence_of :name
  validates_presence_of :buckets

  scope :visible, lambda {where(:visible => true)}
  scope :invisible, lambda {where(:visible => false)}
  scope :newest_first, lambda {order(:created_at => :desc)}
  scope :popular_first, lambda {order(:download_count => :desc)}
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end
