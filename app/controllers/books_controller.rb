class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user,only: [:edit, :update]
	def new
        @book = Book.new
        @user = current_user
        @books = @user.books

    end

    def create
    	@book = Book.new(book_params)
        @book.user_id = current_user.id
    	if @book.save
            flash[:notice] ="successfully"
    		redirect_to book_path (@book.id)
            @user = current_user
    	else
    		@books = Book.all
            @user = current_user
    		render :index
    	end
    
    end

   	def index
        @book = Book.new
   		@books = Book.all
        @user = current_user
   	end

   	def show
        @books = Book.new
        @book = Book.find(params[:id])
        @user = current_user
        @users = @book.user
    end

    def edit

    	@book = Book.find(params[:id])
    end

    def update
    	@book = Book.find(params[:id])
    	if @book.update(book_params)
            flash[:notice] ="successfully"
            redirect_to book_path(@book.id)
        else
            render :edit
        end
    end

    def destroy
    	book = Book.find(params[:id])
        book.destroy
    	redirect_to books_path

    end

    private

    def correct_user
        book = Book.find(params[:id])
        if current_user.id != book.user.id
            redirect_to books_path
        end
    end

    def book_params
    	params.require(:book).permit(:title, :body)
    end
end

