get '/user/new' do
  erb :"static/users/loginsignup"
end

post '/user/create' do
  @user = User.new(params[:user])
  if params[:user][:password].length < 8
    redirect '/pswd_too_shrt'
  end
  @user.password = params[:user][:password]
  if @user.save
    @new_user = User.find_by(email: params[:user][:email])
    erb :"static/users/signupsaved"
  else
    redirect '/not_saved'
  end
end

get '/pswd_too_shrt' do
  erb :"static/users/pswdtooshrt"
end

get '/not_saved' do
  erb :"static/users/signupnotsaved"
end

post '/login' do
  if params[:user][:password].length == 0
    redirect '/pswd_too_shrt'
  end
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    log_in(@user)
    redirect "/user/profile/#{@user.id}"
  else
    redirect '/error'
  end
end

get '/user/profile/:user_id' do
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
