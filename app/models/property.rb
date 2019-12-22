class Property < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	belongs_to :account

	scope :lastest, -> { order created_at: :desc }
end
