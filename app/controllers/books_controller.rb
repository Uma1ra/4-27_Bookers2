class BooksController < ApplicationController

  def new
    @new_book = Book.new
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id

    if @new_book.save
      redirect_to book_path(@new_book.id)
    else
      render :new
    end

  end

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def show
  end

  def edit
    @edit_book = Book.find(params[:id])
  end
  
  def update
    @edit_book = Book.find(params[:id])
    @edit_book.user_id = current_user.id
    
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
