class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @users = User.all
    @comment = Comment.new
  end

  def new
    @blog = Blog.new
    @users = User.all
  end

  def create
    current_user = User.find_by(id: user_params[:id])
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = "ブログを作成しました。"
      redirect_to blogs_path
    else
      @users = User.all
      render "new"
    end
  end

  def destroy
    Blog.find(params[:id]).destroy
    flash[:success] = "ブログを削除しました"
    redirect_to blogs_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body)
    end

    def user_params
      params.require(:user).permit(:id)
    end
end
