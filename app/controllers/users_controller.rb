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
         book = Book.new(user_params)
        # DBへ保存する
         book.save
        # トップ画面へリダイレクト
        redirect_to '/books/:id'
    end

def edit
      @user = User.find(params[:id])
end

def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user.id)

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
