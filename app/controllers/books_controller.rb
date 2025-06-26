class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  end

  def new
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created'
    else
      @books = Book.all  # 追加
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end