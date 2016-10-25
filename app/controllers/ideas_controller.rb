class IdeasController < ApplicationController

  def new
    @categories = Category.all
    @idea = Idea.new
  end

  def create
    @categories = Category.all
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to category_path(@idea.category)
    else
      render :new
    end

    def show
      @idea = Idea.find(params[:id])
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :content, :category_id)
  end

end
