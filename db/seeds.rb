School.destroy_all
Grade.destroy_all
Role.destroy_all
User.destroy_all

ap school = School
            .where(name: "en skole")
            .first_or_create(name: "en skole")


ap grade = Grade
            .where(name: "Ikke Tilknyttet klasse")
            .first_or_create(school_id: school.id, name: "Ikke Tilknyttet klasse")

ap subject = Subject.create(name: "Kop")

ap student = Role
             .where(name: "Student")
             .first_or_create(name: "Student")

ap teacher = Role
             .where(name: "Teacher")
             .first_or_create(name: "Teacher")

ap mentor = Role
            .where(name: "Mentor")
            .first_or_create(name: "Mentor")

ap admin = Role
           .where(name: "Admin")
           .first_or_create(name: "Admin")

ap super_admin = Role
                 .where(name: "Super admin")
                 .first_or_create(name: "Super admin")


ap User
    .where(username: "super admin")
    .first_or_create(username: "guest", email: nil, password_digest: nil, school_id: nil, role_id: nil, grade_id: nil)
ap User
    .where(username: "super admin")
    .first_or_create(username: "super admin", email:"kaspervhauschildt@gmail.com", password_digest: "$2a$10$T7mOWisZVGpCS46EP82U0uSz78x2YOihd34Qu3ol.zX.zz7dgh6Tq", school_id: school.id, role_id: super_admin.id, grade_id: grade.id)

ap User
    .where(username: "admin")
    .first_or_create(username: "admin", email:"kalle@gmail.com", password_digest: "$2a$10$T7mOWisZVGpCS46EP82U0uSz78x2YOihd34Qu3ol.zX.zz7dgh6Tq", school_id: school.id, role_id: admin.id, grade_id: grade.id)
   
ap User
    .where(username: "lære")
    .first_or_create(username: "lære", email: "kim@gmail.com", password_digest: "$2a$10$T7mOWisZVGpCS46EP82U0uSz78x2YOihd34Qu3ol.zX.zz7dgh6Tq", school_id: school.id, role_id: teacher.id, grade_id: grade.id)

ap User
    .where(username: "special pedagog")
    .first_or_create(username: "special pedagog", email: "christian@gmail.com", password_digest: "$2a$10$T7mOWisZVGpCS46EP82U0uSz78x2YOihd34Qu3ol.zX.zz7dgh6Tq", school_id: school.id, role_id: mentor.id, grade_id: grade.id)

ap User
    .where(username: "elev")
    .first_or_create(username: "elev", email: "keneth@gmail.com", password_digest: "$2a$10$T7mOWisZVGpCS46EP82U0uSz78x2YOihd34Qu3ol.zX.zz7dgh6Tq", school_id: school.id, role_id: student.id, grade_id: grade.id)
ap User
    .where(username: "elev2")
    .first_or_create(username: "elev2", email: "birger@gmail.com", password_digest: "$2a$10$T7mOWisZVGpCS46EP82U0uSz78x2YOihd34Qu3ol.zX.zz7dgh6Tq", school_id: school.id, role_id: student.id, grade_id: grade.id)
