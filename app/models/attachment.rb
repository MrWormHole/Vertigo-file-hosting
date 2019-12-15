class Attachment < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  before_save :check_user_plan

  validates_presence_of :name
  validates_presence_of :file  

  scope :visible, lambda {where(:visible => true)}
  scope :invisible, lambda {where(:visible => false)}
  scope :newest_first, lambda {order(:created_at => :desc)}
  scope :popular_first, lambda {order(:download_count => :desc)}
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

  def get_user_selected_plan_to_bytes(plan)
    case plan
    when "FREE"
      return 5  * 10 ** 9
    when "PREMIUM"
      return 100 * 10 ** 9
    when "PRO"
      return 1 * 10 ** 12
    when "ENTERPRISE"
      return "unlimited"
    end
  end

  def check_user_plan
    maximum_limit = get_user_selected_plan_to_bytes(user.selected_plan)
    
    if !(user.used_file_size_in_gb * 10 ** 9 + file.blob.byte_size < maximum_limit)
      errors.add(:attachment, "Uploading failed! Please upgrade your plan to upload more files")
      throw :abort
    end
  end

end
