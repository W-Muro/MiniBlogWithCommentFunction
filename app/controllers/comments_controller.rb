class CommentsController < ApplicationController
  def create
    current_user = User.find_by(id: user_params[:id])
    blog = Blog.find_by(id: blog_params[:blog_id])
    @comment = current_user.comments.build(comment_params)
    @comment.blog_id = blog.id
    if @comment.save
      flash[:success] = "コメントを投稿しました。"
      redirect_to blogs_path
    else
      flash[:alert] = "コメントの投稿に失敗しました。"
      @blogs = Blog.all
      @users = User.all
      render "blogs/index"
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "コメントを削除しました"
    redirect_to blogs_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def user_params
      params.require(:user).permit(:id)
    end

    def blog_params
      params.permit(:blog_id)
    end
end
