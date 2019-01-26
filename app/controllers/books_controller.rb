class BooksController < ApplicationController

before_action :correct_user, only:[:edit, :update]
before_action :authenticate_user!


    def new
    	@book =Book.new
    end
    def create
         @books = Book.new(book_params)
         @books.user_id = current_user.id


      if @books.save
      flash[:notice] = "Saved successfully."
      redirect_to book_path(@books.id)
      else
         @book = Book.all
         @user = current_user
      render 'index'
    end

    end



    def index
    	@books =Book.new
        @user =current_user
        @book =Book.all

    end
    def show
        @book = Book.find(params[:id])
        @books =Book.new
        @user =current_user

    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    def edit
        @book =Book.find(params[:id])
        @books =Book.new

    end

    def update
        book =Book.find(params[:id])
        book.update(book_params)
        @books =Book.new



        if book.update(book_params)
      flash[:notice] = "Updated successfully."
      redirect_to book_path(book.id)

      else
         @user = current_user
         render 'edit'
      end



    end

    # def correct_user
    #     user = current_user.id
    #  if current_user.id != user.id
    #    redirect_to book_path(book.id)
    #  end
    # end


    def correct_user
        book = Book.find(params[:id])
      if book.user_id != current_user.id
         redirect_to users_path
      end
    end





  private
    def book_params
        params.require(:book).permit(:title, :opinion)
    end

end
