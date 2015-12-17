class ImagesController < ApplicationController
	def index
		@image = Image.all
	end
	def show
		@image = Image.find(params[:id])
	end
	def new
		@image = Image.new
	end
	def edit
		@image = Image.find(params[:id])
	end
	def create
		# render plain: params[:album_image].inspect
		@image = Image.new(image_params)

		if @image.save
		render 'show'
		else 
		render 'new'
		end
	end
	def update
		@image = Image.find(params[:id])
		if @image.update(album_params)
			redirect_to @image
		else
			render 'edit'
		end
	end
	def destroy
		@image = Image.find(params[:id])
		@image.destroy

		redirect_to images_path
	end

	private 
	def image_params
		params.require(:album_image).permit(:picture)
	end
end
