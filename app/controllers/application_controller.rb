class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD

  include SessionsHelper

=======
 include SessionsHelper
 
>>>>>>> origin/master
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
<<<<<<< HEAD
=======

  def counts(user)
    @count_microposts = user.microposts.count
  end
>>>>>>> origin/master
end