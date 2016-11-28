# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


School.create(name: "Aspit østjylland")


Grade.create(name: "Ikke Tilknyttet klasse")

Role.create(name: "Student")
Role.create(name: "Teacher")
Role.create(name: "Mentor")
Role.create(name: "Admin")
Role.create(name: "Super admin")

User.create(username: "kaspervh", email:"kaspervhauschildt@gmail.com", password_digest: "tvebakk1", school_id: 1, role_id: 5, grade_id: 1)
User.create(username: "kalle", email:"kalle@gmail.com", password_digest: "tvebakk1", school_id: 1, role_id: 4, grade_id: 1)
User.create(username: "kim", email: "kim@gmail.com", password_digest: "tvebakk1", school_id: 1, role_id: 2, grade_id: 1)
User.create(username: "christian", email: "christian@gmail.com", password_digest: "tvebakk1", school_id: 1, role_id: 3, grade_id: 1)
User.create(username: "keneth", email: "keneth@gmail.com", password_digest: "tvebakk1", school_id: 1, role_id: 1, grade_id: 1)
