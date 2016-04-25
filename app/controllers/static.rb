get '/' do
  erb :"static/index"
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    puts "its saved!"
  else
    puts "not saved =("
  end
end
