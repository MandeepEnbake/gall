class Photo < ActiveRecord::Base
  belongs_to :album
  has_attached_file :snap

  acts_as_taggable
  acts_as_taggable_on :tag_list
end
