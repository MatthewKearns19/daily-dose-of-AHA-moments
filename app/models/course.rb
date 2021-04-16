class Course < ApplicationRecord
  belongs_to :user
  validates_presence_of :course_name, :course_description, :course_content, :user_id
end
