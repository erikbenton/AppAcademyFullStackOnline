class User < ApplicationRecord
  has_many :enrolled_courses,
    class_name: :Course,
    foreign_key: :course_id,
    primary_key: :id

  has_many :enrollments,
    class_name: :Enrollment,
    foreign_key: :student_id,
    primary_key: :id
end
