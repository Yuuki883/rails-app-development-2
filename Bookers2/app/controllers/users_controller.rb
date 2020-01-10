class UsersController < ApplicationController
	  before_action :authenticate_user!

  def index
  	@users = User.all
  	@user = User.find(current_user.id)
  	@book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	# @books = User.where(user_id: params[:id])
  	@books = @user.books

  end


  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
    	flash[:notice] = "You have updated user successfully."
    	redirect_to user_path(@user)
    else
    render 'edit'
   end
  end

  private
  def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
