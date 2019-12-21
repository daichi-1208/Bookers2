class BooksController < ApplicationController

	before_action :authenticate_user!, only: [:new]

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
      	render :index
  	 	end
	end

	def index
		@book = Book.new
  		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def destroy
		@book = book.find(params[:id])
    	@book.destroy
    	redirect_to book_images_path
    end

    def edit
    @book = Book.find(params[:id])
    end

    def update
    	@book = Book.find(params[:id])
    	@book.update(book_params)
    	redirect_to book_path(@book)

    end



private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
	
end
