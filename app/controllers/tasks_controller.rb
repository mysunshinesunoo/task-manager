class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = @category.tasks.where(user: current_user)
  end

  def due_today
    @tasks_due_today = @category.tasks.where(due_date: Date.today, user: current_user)
  end

  def show; end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params.merge(user: current_user))
    if @task.save
      redirect_to category_path(@category), notice: "Task was successfully created."
    else
      flash.now[:alert] = "Failed to create Task."
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to category_task_path(@category, @task), notice: "Task was successfully edited."
    else
      flash.now[:alert] = "Failed to edit Task."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to category_path(@category), notice: "Task was successfully deleted.", status: :see_other
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name, :description, :due_date)
  end
end
