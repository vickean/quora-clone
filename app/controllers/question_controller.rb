get '/user/:user_id/question/new' do
  erb :"static/questions/create"
end

post '/questions/create' do
  new_question = current_user.questions.build(params[:question])
  if new_question.save
    redirect '/questions/saved'
  else
    redirect '/questions/notsaved'
  end
end
