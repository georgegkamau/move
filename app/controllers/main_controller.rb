class MainController < ApplicationController
  def index
    if current_user
      if current_user.applies.count > 0
        redirect_to applies_path  
        return
      end
      if current_user.apartments.count > 0
        redirect_to applies_path  
      end
      redirect_to apartments_path 
    end
  end

  def help
  end

  def faq
  end

  def privacy
  end

  def legal
  end

  def contact
  end
end
 