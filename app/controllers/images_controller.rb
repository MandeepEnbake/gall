class ImagesController < ApplicationController
	def index
		@image = Image.where(:album_id => params[:album_id])
	end
	def show
		@image = Image.find(params[:id])
	end
	def new
		@image_new = Image.new(:album_id => params[:album_id])

	end
	def create
		# render plain: params[:image_params].inspect
		@image = Image.new(image_params)
		# @image = set_tag_list_on(:image_tags, :parse => true )
		# @image = tag_list_on(:image_tags)
		if @image.save
		# redirect_to album_path(Album.find(params[:album_id]))
		# redirect_to album_image_path(params[:id])
		# render article_image_path(params[:album_id])
		# link_to album_image_path(params[:album_id], Image.find(params[:id]))
		redirect_to album_images_path(params[:album_id])
		else 
		render 'new'
		end
	end
	def destroy
		@image = Image.find(params[:id])
		# album_id = Album.@album_id
		@image.destroy

		redirect_to album_images_path(params[:album_id])
	end

	private 
	def image_params
		params.require(:image).permit(:picture, :album_id, :tag_list )
	end
end
