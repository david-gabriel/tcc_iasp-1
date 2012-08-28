class AdminController < ApplicationController
  # Set layout 'admin'
  layout 'admin'
  # Set of methods to be performed on 'before_filter'
  before_filter :check_login_user
  
  # Method responsible to check if user is logged
  def check_login_user
    @logged_user = session['logged_user']
    #@logged_user.delete
    #@logged_user.destroy
    puts @logged_user.nil?
    
    # Check if exists user data in session
    if session[:logged_user].present?
      # Get user data
      @logged_user = User.where(:email => session[:logged_user].email, :password => session[:logged_user].password).first
      # If user data in session are invalid
      if !@logged_user.present?
        # Redirect to home
        redirect_to '/home'
      end
    else
      redirect_to '/home'
    end
  end

end