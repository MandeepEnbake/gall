class PhotosController < ApplicationController
	before_action :authenticate_user!
	def create
		@album = Album.find(params[:album_id])
		@photo = @album.photos.create(photo_params) 
		redirect_to album_path(@album)
	end
	private
		def photo_params
			params.require(:photo).permit(:description)
			params.require(:photo).permit(:tag_list, :tag_list)
	end
end
