class Lesson < ApplicationRecord
   belongs_to :section
   belongs_to :user 
   mount_uploader :video, VideoUploader

   include RankedModel
   ranks :row_order, with_same: :section_id
end
