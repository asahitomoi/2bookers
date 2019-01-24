class UsersController < ApplicationController

before_action :correct_user, only:[:edit, :update]
before_action :authenticate_user!

def  show
  @user = User.find(params[:id])
	@book =@user.books
  @books =Book.new

end
def  index
  @user =current_user
  @books =Book.new
  @users =User.all
end

def create
        # ストロングパラメーターを使用
         user = User.new(user_params)

      if user.save
      flash[:notice] = "Saved successfully."
      redirect_to user_path(user.id)
      else
      render 'index'
    end
end

def edit
      @user = User.find(params[:id])

end

def update
    @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:notice] = "Updated successfully."
      redirect_to user_path(@user.id)
      else
      render'edit'
    end

end

def edit
        @user =User.find(params[:id])

    end



def correct_user
    user =User.find(params[:id])
    if current_user != user
       redirect_to user_path(user.id)
    end
end



  private
    def user_params
        params.require(:user).permit(:name, :introduction, :image)
    end





end
