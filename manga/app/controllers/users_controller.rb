class UsersController < ApplicationController

	def del1
		@user = current_user
		@user.update_attribute(:borrow1, "")
		@user.update_attribute(:current_borrows, @user.current_borrows - 1)
		redirect_to :back
	end

	def del2
		@user = current_user
		@user.update_attribute(:borrow2, "")
		@user.update_attribute(:current_borrows, @user.current_borrows - 1)
		redirect_to :back
	end

	def del3
		@user = current_user
		@user.update_attribute(:borrow3, "")
		@user.update_attribute(:current_borrows, @user.current_borrows - 1)
		redirect_to :back
	end

	def liste
		user_per_page = 5

		sort = case params['sort']
			when "email" then "email"
			when "pseudo" then "pseudo"
			when "name" then "name"
			when "surname" then "surname"
			when "course" then "course"
			when "year" then "year"
			when "current_borrows" then "current_borrows"
			when "last_sign_in_at" then "last_sign_in_at"
			when "admin" then "admin"
			when "email_reverse" then "email DESC"
			when "pseudo_reverse" then "pseudo DESC"
			when "name_reverse" then "name DESC"
			when "surname_reverse" then "surname DESC"
			when "course_reverse" then "course DESC"
			when "year_reverse" then "year DESC"
			when "current_borrows_reverse" then "current_borrows DESC"
			when "last_sign_in_at_reverse" then "last_sign_in_at DESC"
			when "admin_reverse" then "admin DESC"
			end

		@users = User.paginate(:page => params[:page], :per_page => user_per_page).order(sort)
	end

	def update
		@user = current_user
		if @user.update(user_params)
			redirect_to '/'
		else
			render 'user_edit'
		end
	end
	
	private

	def user_params
		params.require(:user).permit(:name,:surname,:pseudo,:course,:year)
	end	

end