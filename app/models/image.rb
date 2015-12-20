class Image < ActiveRecord::Base
	belongs_to :album
	has_attached_file :picture
	
	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
