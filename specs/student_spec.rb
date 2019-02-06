#Codeclan Week 04 Day 03
# Hogwarts Lab - Sinatra/HTTP

require('minitest/autorun')
require('minitest/rg')
require_relative('../models/student.rb')
require('pry')

class TestStudent < MiniTest::Test

  def setup
    @test_student = Student.new({
      "first_name" => "Harry",
      "second_name" => "Potter",
      "house" => "Griffindor",
      "age" => 13
      })
  end


  def test_pretty_print
      assert_equal("Harry Potter",@test_student.pretty_print() )
  end

end
