class AlbumsController < ApplicationController
	before_action :authenticate_user!
	def index
		user = current_user.id
		@album = Album.where(:user_id => user)
	end
	def show
		@album = Album.find(params[:id])
	end
	def new
		@album = Album.new
	end
	def edit
		@album = Album.find(params[:id])
	end
	def create
		@album = Album.new(album_params)

		if @album.save
		redirect_to albums_path
		else 
		render 'new'
		end
	end
	def update
		@album = Album.find(params[:id])
		if @album.update(album_params)
			redirect_to @album
		else
			render 'edit'
		end
	end
	def destroy
		@album = Album.find(params[:id])
		@album.destroy

		redirect_to albums_path
	end

	private 
	def album_params
		params.require(:album).permit(:title, :user_id)
	end
end
