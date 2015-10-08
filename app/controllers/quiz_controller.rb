class QuizController < ApplicationController
  def login
  	session[:correct] = 0
  	session[:incorrect] = 0
  	session[:answers] = [ ]
  end

  def answer
  	unless params[:answer].nil?
  		question = Question::all[params[:id].to_sym]
  		answers = question[:answers]
  		answer = answers[params[:answer].to_i]
  		session[:correct] = new_correct(answer[:correct])
  		session[:incorrect] = new_incorrect(answer[:correct])
  		if session[:answers].nil?
  			session[:answers] = [ ]
  		end
  		unless answer[:correct].nil?
  			session[:answers] << {id: params[:id].to_sym, correct: answer[:correct]}
  		end
  		if answer[:next].nil?
  			redirect_to action: "finish"
  		else
  			redirect_to action: "answer", id: answer[:next].to_s
  		end
  	else
  		@question = Question::all[params[:id].to_sym]
  		@id = params[:id]
  	end
  end

  def finish
  	@answers = session[:answers]
  end

  def login_post
  	session[:email] = params[:email]
  	redirect_to action: "answer", id: "1"
  end

  def new_correct(correct)
  	if correct.nil?
  		return session[:correct]
  	end
  	if session[:correct].nil?
  		return 1 if correct
  		return 0
  	end
  	return session[:correct] + 1 if correct
  	return session[:correct]
  end

  def new_incorrect(correct)
  	if correct.nil?
  		return session[:incorrect]
  	end
  	if session[:incorrect].nil?
  		return 0 if correct
  		return 1
  	end
  	return session[:incorrect] + 1 unless correct
  	return session[:incorrect]
  end
end
