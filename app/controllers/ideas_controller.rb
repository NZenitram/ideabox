class IdeasController < ApplicationController

  def new
    @categories = Category.all
    @idea = Idea.new
  end

  def create
    @categories = Category.all
    @idea = Idea.new(idea_params)
    @idea.user_id = session[:user_id]
    if @idea.save
      redirect_to category_path(@idea.category)
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    @idea = Idea.find(params[:id])
    @image = Image.new
    @images = Image.all
  end


  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to category_path(@idea.category)
  end

  def edit
    @categories = Category.all
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to category_path(@idea.category)
    else
      render :edit
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :content, :category_id, :user_id)
  end

end
