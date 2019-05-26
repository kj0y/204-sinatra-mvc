get '/people' do
  @people = Person.all
  erb :"/people/index"
end

get '/people/:id' do
  @person = Person.find(params[:id])
  birthdate_string = @person.birthdate.strftime("%m%d%y")
  birthday_number = Person.calc_birthpath_num(birthdate_string)
  @message = Person.get_message(birthday_number)

  erb :"/people/show"
end
