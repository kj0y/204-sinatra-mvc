get '/people' do
  @people = Person.all
  erb :"/people/index"
end

get '/people/new' do
  @person = Person.new
  erb :"/people/new"
end

 post '/people' do
    if params[:birthdate].include?("-")
      birthdate = params[:birthdate]
    else
      birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
    end
  
    @person = Person.new(first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate])
    if @person.valid?
      @person.save
      redirect "/people/#{@person.id}"
    else
      @errors = ''
      @person.errors.full_messages.each do |message|
        @errors = "#{@errors} #{message}."
      end
      erb :"/people/new"
    end
  end

get '/people/:id/edit' do
  @person = Person.find(params[:id])
  erb :"/people/edit"
end

put '/people/:id' do
  @person = Person.find(params[:id])
  @person.first_name = params[:first_name]
  @person.last_name = params[:last_name]
  @person.birthdate = params[:birthdate]
  if @person.valid?
    @person.save
    redirect "/people/#{@person.id}"
  else
    @person.errors.full_messages.each do |msg|
      @errors = "#{@errors} #{msg}."
    end
    erb :"/people/edit"    
  end
end

delete '/people/:id' do
  person = Person.find(params[:id])
  person.delete
  redirect "/people"
end

get '/people/:id' do
  @person = Person.find(params[:id])
  birth_path_num = Person.get_birth_path_num(@person.birthdate.strftime("%m%d%Y"))
  @message = Person.get_message(birth_path_num)  
  erb :"/people/show"
end