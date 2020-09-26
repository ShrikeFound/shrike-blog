class TagsController < ApplicationController
  def show 
    @tag = Tag.find(params[:id])
    puts params
    puts @tag
  end

  def index 
    @tags = Tag.all
  end

  def destroy 
    @tag = Tag.find(params[:id])
    if @tag.destroy
      flash.alert = "tag destroyed." 
      redirect_to tags_path
    else
      flash.alert = "sorry, couldn't do it." 
      redirect_to tags_path
    end

  end

end
