class PostImagesController < ApplicationController
	before_action :authenticate_user!

	def new
		@post_image = PostImage.new
	end

	def create
		@post_image = PostImage.new(post_image_params)
		@post_image.user_id = current_user.id
		if @post_image.save
			flash[:notice] = "投稿成功"
		    redirect_to post_image_path(@post_image)
	   else
		render action: :new
	end
	end

	def index
		@post_images = PostImage.all
	end

	def show
		@post_image = PostImage.find(params[:id])
	end

	def destroy
		@post_image = PostImage.find(params[:id])
		@post_image.save
		redirect_to post_images_path
	end

	private
    def post_image_params
        params.require(:post_image).permit(:image, :caption)
    end
end
