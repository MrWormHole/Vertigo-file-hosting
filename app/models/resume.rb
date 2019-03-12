class Resume < ApplicationRecord
  # FIXME attachment file shouldn't be empty it is a major bug
  # TODO about page is not assigned
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model
  validates :name, presence: true # Make sure owner has a name
end
