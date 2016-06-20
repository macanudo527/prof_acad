class HomeController < ApplicationController 
  
  def index
    return redirect_to groupings_path if user_signed_in?
  end

  def about
  end
end
