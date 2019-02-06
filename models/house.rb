#Codeclan Week 04 Day 03
# Hogwarts Lab - Sinatra/HTTP

require_relative('../db/sql_runner')
require('pry')

class House

  attr_reader :house_name, :id


def initialize(options)
  @id = options['id'].to_i
  @house_name = options['house_name']
end

def save
sql = "INSERT INTO houses(
house_name
) VALUES (
  $1
  ) RETURNING *"
values = [@house_name]
house_obj = SqlRunner.run(sql,values)
@id = house_obj.first['id'].to_i

end

def update()

  sql = "UPDATE houses SET
  (
    house_name
  )
  =
  (
    $1
  )
  WHERE id = $2"
  values = [@house_name,@id]
  SqlRunner.run( sql, values )
end


def self.all()
  sql = "SELECT * FROM houses"
  values = []
  houses = SqlRunner.run(sql, values)
  result = houses.map { |house| House.new( house ) }
  return result
end

def self.delete(id)
  sql = "DELETE FROM houses WHERE id = $1"
  values = [id]
  SqlRunner.run(sql, values)
  return "Removed"
end

def self.delete_all()
  sql = "DELETE FROM houses"
  values = []
  SqlRunner.run(sql, values)
end

def self.find(id)
  sql = "SELECT * FROM houses WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql,values)
  houses_hash = results.first
  house = House.new(houses_hash)
  return house
end


end #class end
