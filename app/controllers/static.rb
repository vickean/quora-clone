get '/' do
  erb :"static/index"
end

post '/signup' do
  user = User.new(params[:user])
  if user.encrypted_password.length < 8
    redirect '/pswd_too_shrt'
  end
  user.password = params[:encrypted_password]
  if user.save
    redirect '/saved'
  else
    redirect '/not_saved'
  end
end
