class BooksController < ApplicationController

	before_action :authenticate_user!

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
  	 	flash[:notice] = "Book was successfully created."
      	redirect_to book_path(@book.id)
    	else
     	@books = Book.all
      @side_user = current_user
      	render :index
  	 	end
	end

	def index
  		@books = Book.all
      @side_user = current_user
      @book = Book.new
	end

	def show
		@book = Book.find(params[:id])
    @side_user = @book.user
	end

	def destroy
		@book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    end

    def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
    end

    def update
    	@book = Book.find(params[:id])
      if @book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
      else
      render :edit
      end

    end



private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
    def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
	
end
