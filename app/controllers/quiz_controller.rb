class QuizController < ApplicationController
  def login
  end

  def answer
  	unless params[:answer].nil?
  		raise "Not implemented"
  	else
  		@question = Question::all[params[:id].to_sym]
  		@id = params[:id]
  	end
  end

  def finish
  end

  def login_post
  	session[:email] = params[:email]
  	redirect_to action: "answer", id: "1"
  end
end
