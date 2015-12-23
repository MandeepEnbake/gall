class Album < ActiveRecord::Base
	has_many :images, dependent: :destroy
	has_many :photos
	belongs_to :user
	validates :title, presence: true
end
