helpers do
  def current_answer
    if session[:answer_id]
      @current_answer ||= Answer.find_by_id(session[:answer_id])
    end
  end

  def in_answer?
    !current_answer.nil?
  end

  def access_answer(answer)
    session[:answer_id] = answer.id
  end

  def exit_answer
    session[:answer_id] = nil
  end

end
