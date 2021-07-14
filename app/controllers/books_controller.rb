class BooksController < ApplicationController
  
  
  def top
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:succes]= "Book was succcesfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
    
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:succes]= "Book was succcesfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
    
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    if @book.destroy
      flash[:succes]= "Book was succcesfully destroyed."
      redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end