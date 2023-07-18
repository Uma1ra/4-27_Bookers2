class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @new_book = Book.new
  end

  def create
    @new_book = Book.new(book_params)
    @books = Book.all

    if @new_book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@new_book.id)
    else
      render:index
    end

  end

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @show_book = Book.find(params[:id])
    @new_book = Book.new
  end

  def edit
    @edit_book = Book.find(params[:id])
  end
  
  def update
    @edit_book = Book.find(params[:id])
    
    if @edit_book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@edit_book.id)
    else
      render:edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
  end

end
