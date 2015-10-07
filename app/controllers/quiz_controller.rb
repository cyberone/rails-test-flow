class QuizController < ApplicationController
  def login
  end

  def answer
  end

  def finish
  end

  def login_post
  	session[:email] = params[:email]
  	redirect_to action: "answer", id: "1a"
  end
end
