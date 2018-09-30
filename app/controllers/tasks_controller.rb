class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :destroy]

  def index
<<<<<<< HEAD
    @tasks = current_user.tasks.page(params[:page]).per(3)
=======
    if logged_in?
      @micropost = current_user.microposts.build  # form_for 用
      @microposts = current_user.microposts.order('created_at DESC').page(params[:page])
    end
      @tasks = Task.all.page(params[:page]).per(3)
>>>>>>> origin/master
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      flash[:success] = 'Taskは問題なく提出されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは提出できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Taskは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'Taskは正常に削除されました'
    redirect_to tasks_url
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end