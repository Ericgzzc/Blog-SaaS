class PostsController < ApplicationController
  def index
    @posts = Post.published.recent
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params) # => {title: '', content: ''}
      redirect_to "/posts/#{@post.id}/edit"
    else
      render :edit
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
