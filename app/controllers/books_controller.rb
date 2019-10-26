class BooksController < ApplicationController

  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
  	  flash[:notice] = "You have creatad book successfully."
  	  redirect_to book_path(@book)
  	else
  	  @books = Book.all
  	  render action: :index
  	end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = @book.user
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
   @book = Book.find(params[:id])
   if @book.user != current_user
     redirect_to books_path
   end
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
  	   redirect_to book_path(@book.id)
    else
      render "edit"
    end
  end

  def destroy
	 @book = Book.find(params[:id])
   if @book.destroy
	   redirect_to books_path
   else

   end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
