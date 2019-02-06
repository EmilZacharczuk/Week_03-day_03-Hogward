require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/student.rb')
also_reload('./models/*')

get '/' do
  erb(:index)
end

get '/all-students' do #index
  @students = Student.all()
  erb(:index)
end

get '/new' do #new
  erb(:new)
end

get '/:id' do #show
  @student = Student.find (params[:id])
  erb(:show)
end

post '/' do #create
  @student = Student.new(params)
  @student.save
  erb(:created)
end
