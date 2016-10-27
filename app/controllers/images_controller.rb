class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @idea = Idea.find(params[:idea_id])
    @image_idea = ImageIdea.new
    @image = Image.new(image_params)
    @image.user_id = session[:user_id]
    @image.save
    @image_idea.image_id= @image.id
    @image_idea.idea_id = params[:idea_id]
    @image_idea.save
    redirect_to category_idea_path(@idea.category, @idea)
  end

  def destroy
    @image = Image.find(params[:image_id])
    @image.destroy
    redirect_to category_path(@idea.category)
  end

  private

  def image_params
   params.require(:image).permit(:image, :user_id)
  end
end
