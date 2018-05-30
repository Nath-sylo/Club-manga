class OuvragesController < ApplicationController

  def index
    manga_per_page = 5

    sort = case params['sort']
           when "title"  then "title"
           when "author"   then "author"
           when "editor" then "editor"
           when "date" then "release_date"
           when "genre" then "genre"
           when "title_reverse"  then "title DESC"
           when "author_reverse"   then "author DESC"
           when "editor_reverse" then "editor DESC"
           when "date_reverse" then "release_date DESC"
           when "genre_reverse" then "genre DESC"
           end

    if params[:search]
      @ouvrages = Ouvrage.paginate(:page => params[:page], :per_page => manga_per_page).order(sort).search(params[:search])
    else
      @ouvrages = Ouvrage.paginate(:page => params[:page], :per_page => manga_per_page).order(sort)
    end
  end

  def show
    @ouvrage = Ouvrage.find(params[:id])
    @comments = Commentary.where(:ouvrage_id => @ouvrage.id).paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    @missing = @ouvrage.missing_tome.split(";")
    @tab = []
    if @missing != "-"
      for n in (@ouvrage.begin..@ouvrage.final) do
        @missing.each do |tome|
          if tome.to_i == n
            @tab[n] = false
          else
            @tab[n] = true
          end
        end
      end
    end
    if user_signed_in?
      @user = current_user
    end
  end

  def borrows
    @ouvrage = Ouvrage.find(params[:id])

    @user = current_user
    @emprunt = @ouvrage.title+" tome "+params[:tome].to_s
    @test1 = User.where(borrow1: @emprunt)
    @test2 = User.where(borrow2: @emprunt)
    @test3 = User.where(borrow3: @emprunt)

    if @test1 == [] && @test2 == [] && @test3 == [] && @user.current_borrows < 3
      @user.update_attribute(:current_borrows, @user.current_borrows + 1)
      if @user.borrow1 == ""
        @user.update_attribute(:borrow1, @emprunt)
      elsif @user.borrow2 == ""
        @user.update_attribute(:borrow2, @emprunt)
      elsif @user.borrow3 == ""
        @user.update_attribute(:borrow3, @emprunt)
      end
      redirect_to :back, notice: "Manga Emprunté"
    else
      if @user.current_borrows == 3
        redirect_to :back, notice: "Limite d'emprunts atteint"
      else
        redirect_to :back, notice: "Manga indisponible"
      end
    end
  end

end
