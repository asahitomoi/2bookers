class BooksController < ApplicationController

    def new
    	@book =Book.new
    end
    def create
         @book = Book.new(book_params)
         @book.user_id = current_user.id
         @book.save

      if @book.save
      flash[:notice] = "Saved successfully."
      redirect_to book_path(@book.id)
      else
      flash[:notice] = "Saved error"
      render("books/new")
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
        @user =@book.user
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    def edit
        @book =Book.find(params[:id])
    end

    def update
        book =Book.find(params[:id])
        book.update(book_params)

        if book.update(book_params)
      flash[:notice] = "Updated successfully."
      redirect_to book_path(book.id)
      else
      flash[:notice] = "Updated error"
      render("books/new")
    end


    end




  private
    def book_params
        params.require(:book).permit(:title, :opinion)
    end

end