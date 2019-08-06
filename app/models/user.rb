class User < ApplicationRecord
  has_one_attached :avatar

  validates_presence_of :name

  # learn how to use only image types with active record

  #after_create :set_filename

  # def set_filename
  #  if self.avatar.attached?
  #   self.avatar.blob.update(filename: "desired_filename.#{self.avatar.filename.extension}")
  #  end
  #end
end
