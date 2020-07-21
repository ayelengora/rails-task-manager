class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :show, :edit, :update]

  def destroy
    @task.destroy
    redirect_to tasks_path
  end
  
  def index
    @tasks = Task.all
  end
  
  def show
  end

  def new
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end
  
  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end
  

  private

  def set_task
    @task = Task.find(params[:id])
  end 
  
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end


end
