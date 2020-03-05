class User < ApplicationRecord
  has_many :courses,
    class_name: :Course,
    foreign_key: :course_id,
    primary_key: :id
end
