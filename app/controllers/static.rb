get '/' do
  erb :"static/index"
end

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
    erb :"static/users/profile"
  else
    redirect '/error'
  end
end

get '/error' do
  erb :"static/users/wrongdetails"
end

get '/logout' do
  log_out
  redirect '/'
end

# get '/users/:id' do
#
# end
