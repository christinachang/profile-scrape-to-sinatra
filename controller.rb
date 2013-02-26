require './profile-scrape.rb'

get '/' do  
  @students = Student.all  
  erb :home  
end

get '/:id' do
  @student = Student.find params[:id]
  erb :profile
end