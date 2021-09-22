class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
     redirect_to book_path(@book.id)
     flash[:notice] = "User was successfully created."
    else
      @users = User.all
      render 'index'
    end
  end

 def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to user_path(@user.id) 
    flash[:notice] = "User was successfully updated."
  else
    @users = User.all
    # @book = Book.new
    render 'edit'
  end
    
 end
 

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
