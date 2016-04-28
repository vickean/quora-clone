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

get '/user/:user_id/questions/:question_id/edit' do
  erb :"static/questions/q_update"
end

post '/user/:user_id/questions/:question_id/update' do
  current_question
  edit_question = Question.find(@current_question.id)
  edit_question.update(params[:question])
  redirect "/questions/#{@current_question.id}"
end

delete '/user/:user_id/questions/:question_id' do
  current_user
  current_question
  delete_question = Question.find(@current_question.id)
  delete_question.destroy
  redirect "/user/profile/#{@current_user.id}"
end
