class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
	  @book = Book.new
  	@users = User.all
    @side_user = current_user
  end

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @side_user = @user
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(current_user.id),notice:"successfully"
  else
    render 'edit'
  end
  end

  private
	def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
