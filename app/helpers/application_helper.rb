module ApplicationHelper

  def logged_in?
    return session[:username] != nil
  end

  def current_user
    if logged_in?
      return User.find_by(username: session[:username])
    end
    nil
  end

  def owner?(game)
    return game.owners.include?(current_user)
  end

end
