class PagesController < ApplicationController
  def home
  	@moment = rand(Ouvrage.last.id)
  	while @moment==0
  		@moment = rand(Ouvrage.last.id)
  	end
  end

  def liste_inscrits
  	user_per_page = 10

    sort = case params['sort']
           when "name"  then "name"
           when "email" then "email"
           when "surname" then "surname"
           when "pseudo" then "pseudo"
           when "name_reverse"  then "name DESC"
           when "email_reverse" then "email DESC"
           when "surname_reverse"   then "surname DESC"
           when "pseudo_reverse" then "pseudo DESC"
           end


    @users = User.paginate(:page => params[:page], :per_page => user_per_page).order(sort)
  end

  def profil
  	@user = User.find(params[:id])
  end
end
