class UsersController < ApplicationController
    
before_action :authenticate_user!
before_action :user_check,only:[:edit, :update]


  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=Book.where(user_id: @user.id)
  end
  
  def index
    @book=Book.new
    @books=Book.all
    @user=current_user
    @users=User.all
  end
  
  def edit
   @user=User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
   else
    render :edit
   end
  end
  
  def user_check
   @user=User.find(params[:id])
   unless @user==current_user
    redirect_to user_path(current_user.id)
   end
  end
  
   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
