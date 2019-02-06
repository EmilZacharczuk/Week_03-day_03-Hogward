#Codeclan Week 04 Day 03
# Hogwarts Lab - Sinatra/HTTP
require('pry')
require_relative('../db/sql_runner')
require_relative("house")


class Student

  attr_reader :first_name, :second_name, :house, :age, :id


  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house'].to_i
    @age = options['age'].to_i
  end

  def save
    sql = "INSERT INTO students(
    first_name,
    second_name,
    house,
    age
    ) VALUES (
    $1,$2,$3,$4
    ) RETURNING *"
    values = [@first_name,@second_name,@house,@age]
    student_obj = SqlRunner.run(sql,values)
    @id = student_obj.first['id'].to_i
  end

  def update()

    sql = "UPDATE students SET
    (
      first_name,second_name, house, age
    )
    =
    (
      $1,$2,$3,$4
    )
    WHERE id = $5"
    values = [@first_name,@second_name,@house,@age,@id]
    SqlRunner.run( sql, values )
  end

  def house()
    sql = "SELECT houses.* FROM houses WHERE id = $1"
    values = [@house]
    houses = SqlRunner.run(sql, values)
    # result = houses.map {|house| house['house_name']}
    # return result[0]
    return houses[0]['house_name']
  end

  def pretty_print
    return "#{@first_name} #{@second_name}"
  end

  def self.all()
    sql = "SELECT * FROM students"
    values = []
    students = SqlRunner.run(sql, values)
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def self.delete(id)
    sql = "DELETE FROM students WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
    return "Removed"
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values)
    student= Student.new(result.first)
    return student
  end
end #class end
