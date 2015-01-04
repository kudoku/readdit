class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy, :upvote, :downvote]

  def index
    @links = Link.order(votes: :desc).page(params[:page])
    @link = Link.new
  end

  def show
    @comment = Comment.new
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(link_params)
    @link.save
    if @link.save
      redirect_to @link
    else
      render  :new
    end
  end

  def edit
  end

  def update
    @link.update_attributes(link_params)
    if @link.update_attributes(link_params)
      redirect_to @link
    else
      render  :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path
  end

  def upvote
    @link = Link.find(params[:id])
    @link.votes += 1
    @link.save
    redirect_to root_path   
  end

  def downvote
    @link = Link.find(params[:id])
    @link.votes -= 1
    @link.save
    redirect_to root_path
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :url)
    end

end
