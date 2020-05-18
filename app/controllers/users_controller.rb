class UsersController < ApplicationController
  def show
    @posts = current_user.posts.order(created_at: "DESC").page(params[:pagge]).per(40)
  end
end
