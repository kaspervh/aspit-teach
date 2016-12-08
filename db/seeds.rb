School.destroy_all
Grade.destroy_all
Role.destroy_all
User.destroy_all

school = School.create(name: "Aspit østjylland")


grade = Grade.create(name: "Ikke Tilknyttet klasse")

student = Role.create(name: "Student")
teacher = Role.create(name: "Teacher")
mentor = Role.create(name: "Mentor")
admin = Role.create(name: "Admin")
super_admin = Role.create(name: "Super admin")

User.create(username: "super admin", email:"kaspervhauschildt@gmail.com", password_digest: "tvebakk1", school_id: super_admin, role_id: 5, grade_id: 1)
User.create(username: "admin", email:"kalle@gmail.com", password_digest: "tvebakk1", school_id: 1, role_id: admin, grade_id: 1)
User.create(username: "lære", email: "kim@gmail.com", password_digest: "tvebakk1", school_id: 1, role_id: teacher, grade_id: 1)
User.create(username: "special pedagog", email: "christian@gmail.com", password_digest: "tvebakk1", school_id: 1, role_id: mentor, grade_id: 1)
User.create(username: "elev", email: "keneth@gmail.com", password_digest: "tvebakk1", school_id: 1, role_id: student, grade_id: 1)
