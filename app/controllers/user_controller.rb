get '/loginsignup' do
  erb :"static/users/loginsignup"
end

post '/signup' do
  user = User.new(params[:user])
  if params[:user][:password].length < 8
    redirect '/pswd_too_shrt'
  end
  user.password = params[:user][:password]
  if user.save
    redirect '/saved'
  else
    redirect '/not_saved'
  end
end

get '/pswd_too_shrt' do
  erb :"static/users/pswdtooshrt"
end

get '/saved' do
  erb :"static/users/signupsaved"
end

get '/not_saved' do
  erb :"static/users/signupnotsaved"
end

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    log_in(@user)
    redirect "/profile/#{@user.id}"
  else
    redirect '/error'
  end
end

get '/profile/:user_id' do
  @user_profile = User.find(params[:user_id])
  erb :"static/users/profile"
end

get '/error' do
  erb :"static/users/wrongdetails"
end

get '/logout' do
  log_out
  redirect '/'
end
