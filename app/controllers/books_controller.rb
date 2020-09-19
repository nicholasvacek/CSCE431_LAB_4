class BooksController < ApplicationController
  def index
    @Books = Book.sorted
  end

  def show
    @Book = Book.find(params[:id])
  end

  def new
    @Book = Book.new
  end

  def create
    @Book = Book.new(book_params)
    #@Book.published_date = params["published_date(2i)"].to_s + '-' + params["published_date(3i)"].to_s + '-' + params["published_date(1i)"].to_s#Date.civil(params["published_date(2i)"].to_i,params["published_date(3i)"].to_i,params["published_date(1i)"].to_i).to_s

    if @Book.save
      flash[:notice] = "Book successfully added to the collection."
      redirect_to(books_path)
    else
      render('new')
    end
  end

  def edit
    @Book = Book.find(params[:id])
  end

  def update
    @Book = Book.find(params[:id])
    if @Book.update_attributes(book_params)
      flash[:notice] = "Book successfully updated."
      redirect_to(book_path(@Book))
    else
      render('edit')
    end
  end

  def delete
    @Book = Book.find(params[:id])
  end

  def destroy
    @Book = Book.find(params[:id])
    @Book.destroy
    flash[:notice] = "Book successfully deleted and destroyed from the collection."
    redirect_to(books_path)
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :price, :published_date)
  end
end
