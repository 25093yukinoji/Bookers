class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      render("books/new")
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
