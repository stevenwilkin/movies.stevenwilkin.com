class AdminController < ApplicationController

  before_filter :authenticate, :except => :logout

  def login
    redirect_to root_path
  end

  def logout
    session[:admin] = nil
    redirect_to root_path
  end

end
