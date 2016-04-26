get '/questions' do
  erb :"static/questions/create"
end

post '/questions/new' do
  new_question = current_user.questions.build(params[:question])
  if new_question.save
    redirect '/questions/saved'
  else
    redirect '/questions/notsaved'
  end
end
