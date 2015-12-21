class TagsController < ApplicationController
	def index
	    @tags = ActsAsTaggableOn::Tag.all
	  end

	  def show
	    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
	    @images = Image.tagged_with(@tag.name)
	    # render plain: params[:id].inspect
	  end
end
