class OuvragesController < ApplicationController
  def index
    if user_signedin?
      redirect_to ouvrages_path
    else
      redirect_to new_user_session_path
    end

  end
  
end
