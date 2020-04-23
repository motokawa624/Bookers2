class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
        redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully created."
    else 
      @books = Book.all
      render "index"
    end 
  end
  
  def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to books_path(@book.id)
  else
    render "edit"
  end
  
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books(@book.id)
  end
  
      private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
