School.destroy_all
Grade.destroy_all
Role.destroy_all
User.destroy_all

ap school = School.create(name: "Aspit østjylland")


ap grade = Grade.create(name: "Ikke Tilknyttet klasse")

ap student = Role.create(name: "Student")
ap teacher = Role.create(name: "Teacher")
ap mentor = Role.create(name: "Mentor")
ap admin = Role.create(name: "Admin")
ap super_admin = Role.create(name: "Super admin")

ap User.create(username: "super admin", email:"kaspervhauschildt@gmail.com", password_digest: "tvebakk1", school_id: school.id, role_id: super_admin.id, grade_id: grade.id)
ap User.create(username: "admin", email:"kalle@gmail.com", password_digest: "tvebakk1", school_id: school.id, role_id: admin.id, grade_id: grade.id)
ap User.create(username: "lære", email: "kim@gmail.com", password_digest: "tvebakk1", school_id: school.id, role_id: teacher.id, grade_id: grade.id)
ap User.create(username: "special pedagog", email: "christian@gmail.com", password_digest: "tvebakk1", school_id: school.id, role_id: mentor.id, grade_id: grade.id)
ap User.create(username: "elev", email: "keneth@gmail.com", password_digest: "tvebakk1", school_id: school.id, role_id: student.id, grade_id: grade.id)
