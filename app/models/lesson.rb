class Lesson < ApplicationRecord
   belongs_to :section
   belongs_to :user 
   mount_uploader :video, VideoUploader
end
