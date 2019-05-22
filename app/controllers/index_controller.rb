require 'sinatra'

#Ask the user for their birthdate and store in a variable
def get_birthday
    puts("Please enter your birthdate in the format: MMDDYYYY")
    birthdate = gets
end


 def setup_index_view
   birthdate = params[:birthdate]
   birthday_number = Person.calc_birthpath_num(birthdate)
   @message = "Your numerology number is #{birthday_number}. " + Person.get_message(birthday_number)
   erb :index
 end

get '/form' do
  erb :form
end

get '/' do
  erb :form
end

get '/message/:birthday_number' do
    birthday_number = params[:birthday_number].to_i
    @message = "Your numerology number is #{birthday_number}. " + Person.get_message(birthday_number)
    erb :index
end

post '/' do
  birthdate = params[:birthdate].gsub("-","")
  if Person.valid_birthdate(birthdate)
    birthday_number = Person.calc_birthpath_num(birthdate)
    redirect "/message/#{birthday_number}"
  else
    erb :form
    @error = "Oops! You should enter a valid birthdate in the form of mmddyyyy. Try again!"
    erb @error
  end
end

get '/:birthdate' do
  setup_index_view()
end




