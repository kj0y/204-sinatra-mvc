get '/:birthdate' do
  setup_index_view
end

get '/message/:birthday_number' do
    birthday_number = params[:birthday_number].to_i
    @message = Person.get_message(birthday_number)
    erb :index
end

get '/' do
  erb :form
end

post '/' do
  birthdate = params[:birthdate].gsub("-","")
  
  if Person.valid_birthdate(birthdate)
    birthday_number = Person.calc_birthpath_num(birthdate)
    redirect "/message/#{birthday_number}"
  else
    @error = "Oops! You should enter a valid birthdate in the form of mmddyyyy. Try again!"
    erb :form
  end
end

 def setup_index_view
   birthdate = params[:birthdate]
   birthday_number = Person.calc_birthpath_num(birthdate)
   @message = Person.get_message(birthday_number)
   erb :index
 end












