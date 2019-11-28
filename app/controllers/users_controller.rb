class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]
	def edit
		@user = User.find(params[:id])
	end

	# def create
	# 	@user = User.new(content: params[:content])
	# 	if @user.save
	# 		redirect_to ("new_book_path"),
	# 		notice: 'successfully'
	# 	else
	# 		render("new_user_registration_path")
	# 	end
	# end

	def show
		@book = Book.new
		@users = User.find(params[:id])
		@books = @users.books
		@user = current_user

	end

	def index
		@book = Book.new
		@users = User.all
		@user = current_user
		
		
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] ="successfully"
			redirect_to user_path(@user.id)
		else
			render :edit
		end

	end

	private
	
    def correct_user
        user = User.find(params[:id])
        if current_user != user
            redirect_to user_path(current_user)
        end
    end

	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
