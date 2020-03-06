class Course < ApplicationRecord
  has_many :enrolled_students,
    class_name: :User,
    foreign_key: :student_id,
    primary_key: :id

  has_many :enrollments,
    class_name: :Enrollment,
    foreign_key: :course_id,
    primary_key: :id
end
