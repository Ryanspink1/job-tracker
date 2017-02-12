class CategoriesController < ApplicationController
  before_action :set_category, only:[:show, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.title} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id]).destroy
    category.destroy

    flash[:success] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end

private

def set_category
  @category = Category.find(params[:id])
end

def category_params
  params.require(:category).permit(:title)
end

end
