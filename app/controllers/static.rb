get '/' do
  erb :"static/index"
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

post '/login' do
  # pswd = params[:encrypted_password]
  # @login = User.find_by(params[:email])
  #
  # if BCrypt::Password.new(@login.encrypted_password) == pswd
  #   erb :"static/profile"
  # else
  #   redirect '/accessdenied'
  # end
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    log_in(@user)
    erb :"static/profile"
  else
    @error_message = "Wrong email or password."
    redirect '/error'
  end

end
