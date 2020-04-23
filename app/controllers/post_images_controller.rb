class PostImagesController < ApplicationController
	before_action :authenticate_user!
	
	def new
		@post_image = PostImage.new
	end

	def create
		@post_image = PostImage.new(post_image_params)
		@post_image.save
		redirect_to post_images_path
	end

	def index
		@post_images = PostImage.all
	end

	def show
		
	end

	private
    def post_image_params
        params.require(:post_image).permit(:image, :caption)
    end
end
