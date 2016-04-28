get '/user/:user_id/question/:question_id/answer/new' do
  erb :"static/answers/a_create"
end

post '/answers/create' do
  current_question
  current_question_id = @current_question.id
  new_answer = current_user.answers.build(params[:answer])
  new_answer.question_id = current_question_id
  if new_answer.save
    redirect "/questions/#{current_question_id}"
  else
    redirect '/answers/a_not_saved'
  end
end

get '/user/:user_id/question/:question_id/answer/:answer_id/edit' do
  edit_answer = Answer.find(params[:answer_id])
  access_answer(edit_answer)
  erb :"static/answers/a_update"
end

post '/user/:user_id/questions/:question_id/answer/:answer_id/update' do
  current_answer
  edit_answer = Answer.find(@current_answer.id)
  edit_answer.update(params[:answer])
  redirect "/questions/#{params[:question_id]}"
end

delete '/user/:user_id/questions/:question_id/answers/:answer_id' do
  delete_answer = Answer.find(params[:answer_id])
  delete_answer.destroy
  redirect "/questions/#{params[:question_id]}"
end
