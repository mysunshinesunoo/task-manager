class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = current_user.categories
    @due_today = current_user.tasks.where(due_date: Date.today)
  end

  def show
    @category_tasks = @category.tasks
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to category_path(@category), notice: "Category was successfully created."
    else
      flash.now[:alert] = "Failed to create a new Category."
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end
  
  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully edited."
    else
      flash.now[:alert] = "Failed to edit Category."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category was successfully deleted.", status: :see_other
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name, :description)
  end
end
