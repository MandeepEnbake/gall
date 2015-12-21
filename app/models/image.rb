class Image < ActiveRecord::Base
	belongs_to :album
	has_attached_file :picture, styles: { medium: "320x320>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

	acts_as_taggable
	acts_as_taggable_on :image_tags
	
	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
