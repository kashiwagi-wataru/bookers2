class UsersController < ApplicationController
	before_action :authenticate_user!

	before_action :baria_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
	@books = @user.books
	@book = Book.new 
	@comment =Comment.new
  end

  def index
  	@users = User.all
	@book = Book.new 
	@comment =Comment.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "successfully updated user!"
	  else
  		render "edit"
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :postal_code, :address)
  end

   def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
   end

end
