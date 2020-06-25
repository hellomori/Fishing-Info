class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.includes(:user).order(created_at: "DESC").page(params[:page]).per(40)
  end

  def new
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
    @post = Post.new
    @post.images.new
    3.times{@post.images.build}
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: "DESC")
  end

  def search
    @posts = Post.search(params[:keyword]).order(created_at: "DESC").page(params[:page]).per(40)
  end

  def seabass
  end

  def eging
  end

  def ajing
  end

  def shore_jiggig
  end

  def wind
  end

  def bass
  end

  def enjoy
  end

  def osaka
  end

  def wakayama
  end

  def kyoto
  end

  def hyogos
  end

  def hyogon
  end

  def awaji
  end

  def where_is_wally
  end

  def where_is_wally2
  end

  def clear
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :area_id, :rank, tag_list: [], images_attributes: [:src]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
