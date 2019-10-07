class User < ApplicationRecord
  has_one_attached :file
  validates_presence_of :name_of_file
end
