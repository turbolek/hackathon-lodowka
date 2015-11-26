Fridge.destroy_all

10.times do |n|
	Fridge.create(name: "test_fridge_#{n}")
end
