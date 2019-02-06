require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()

house_1 = House.new({
  'house_name' => 'Slytherin'
  })

house_2 = House.new({
    'house_name' => 'Gryffindor'
    })

house_3 = House.new({
      'house_name' => 'Ravenclaw'
      })

house_4 = House.new({
    'house_name' => 'Hufflepuff'
      })

house_1.save
house_2.save
house_3.save
house_4.save


student1 = Student.new({
  "first_name" => "Harry",
  "second_name" => "Potter",
  "house" => house_2.id,
  "age" => 13
})

student2 = Student.new({
  "first_name" => "Ron",
  "second_name" => "Weasely",
  "house" => house_2.id,
  "age" => 14
})

student1.save
student2.save
