get '/createq' do
  erb :"static/questions/create"
end

post '/createq' do
  current_user
  new_question = Question.new(params[:question])
  @current_user.id = new_question.user_id
  if new_question.save
    redirect '/qsaved'
  else
    redirect '/qnotsaved'
  end
end
