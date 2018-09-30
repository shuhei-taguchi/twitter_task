class ToppagesController < ApplicationController
  def index
    if logged_in?
<<<<<<< HEAD
      @task = current_user.tasks.build
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
=======
      @micropost = current_user.microposts.build  # form_for 用
      @microposts = current_user.microposts.order('created_at DESC').page(params[:page])
>>>>>>> origin/master
    end
  end
end
