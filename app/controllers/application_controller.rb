class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session # Null session to avoid development issues

  def hello
    render html: "Hello World!"
  end

  def goodbye
    render html: "Goodbye world!"
  end
end
