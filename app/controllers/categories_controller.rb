class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @user = User.find(session[:user_id]) if !session[:user_id].nil?
    @category = Category.find(params[:id])
    @users_ideas = @user.ideas.where(category_id: @category.id) if !session[:user_id].nil?
    @ideas = @category.ideas
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.detroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
