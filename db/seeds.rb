User.create(email: 'user1@test.test', password: 12345678, password_confirmation: 12345678)
User.create(email: 'user2@.test.test', password: 12345678, password_confirmation: 12345678)
User.create(email: 'user3@.test.test', password: 12345678, password_confirmation: 12345678)
Fridge.destroy_all

10.times do |n|
	Fridge.create(name: "test_fridge_#{n}")
end