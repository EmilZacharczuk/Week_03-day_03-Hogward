require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()

house_1 = House.new({
  'house_name' => 'Slythering'
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

student3 = Student.new({
  "first_name" => "Hermione",
  "second_name" => "Granger",
  "house" => house_1.id,
  "age" => 24
  })

student4 = Student.new({
  "first_name" => "Gilderoy",
  "second_name" => "Lockhart",
  "house" => house_3.id,
  "age" => 5
  })
student1.save
student2.save
student3.save
student4.save
