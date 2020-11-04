class PostsController < ApplicationController
    def index 
        @post = Post.all.order("created_at DESC")
    end
    def new
        @post = Post.new
    end
    def create
        @post = Post.new(post_param)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end
    def show
        @post = Post.find(params[:id])
    end
    def delete
    end
    
    private
    
    def post_param
        params.require(:post).permit(:title, :content)
    end
end
