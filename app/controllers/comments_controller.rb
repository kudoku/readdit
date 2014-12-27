class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :set_link

  def show
    @comment = link.comments.find(:link_id)
  end

  def create
    @comment = @link.comments.build(comment_params)
    @comment.save
    redirect_to @link
  end

  def update
  end

  def destroy
    @comment.destroy
    redirect_to @link
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :content)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_link
      @link = Link.find(params[:link_id])
    end
end
