class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    new_task = Task.new(task_params)
    new_task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    if params[:task]['completed'] == '1'
      @task.completed = true
      @task.save
    end
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

private


  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

   def set_task
    @task = Task.find(params[:id])
   end

end
