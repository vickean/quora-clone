helpers do
  def current_question
    if session[:question_id]
      @current_question ||= Question.find_by_id(session[:question_id])
    end
  end

  def in_question?
    !current_question.nil?
  end

  def access_question(question)
    session[:question_id] = question.id
  end

  def exit_question
    session[:question_id] = nil
  end

end
