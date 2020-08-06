class TasksController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end


end