class Course < ApplicationRecord
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        through: :enrollments,
        source: :user
    
    belongs_to :prerequisite
        primary_key: :id
        foreign_key: :prereq_id
        class_name: :Course

    belongs_to :in
end

# shoot, time's up
# so I was thinking that it'd belong to the "instructors" association
# the primary key would be 'id' as usual with the foreign_key being set as 'instructor_id'
# the class name would be set as 'User' since that's what we'll be going into.