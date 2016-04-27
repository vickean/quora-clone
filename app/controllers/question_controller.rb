get '/user/:user_id/question/new' do
  erb :"static/questions/q_create"
end

post '/questions/create' do
  new_question = current_user.questions.build(params[:question])
  if new_question.save
    redirect "/questions/#{new_question.id}"
  else
    redirect '/questions/notsaved'
  end
end

get '/questions/:question_id' do
  this_question = Question.find(params[:question_id])
  access_question(this_question)
  erb :"static/questions/q_read"
end
