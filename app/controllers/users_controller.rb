class UsersController < ApplicationController
  # Method responsible to login user in admin area
  def login
    # If form was submited
    if request.post?
      # Search for user with typed data
      @@user = User.where(:email => params[:user][:email], :password => params[:user][:password]).first
      
      # If is a valid user
      if(@@user)
        # save data on session
        session[:logged_user] = @@user
        # redirect to product path (admin)
        redirect_to admin_products_path
      else
        flash[:error] = 'Email ou senha invalidos.'
      end
    end
  end
  
  # Method responsible to logout user from admin area
  def logout
    #render :nothing => true
    
    # Check if exists user data in session
    if session[:logged_user].present?
      # Delete user data from session
      session.delete(:logged_user)
    end
    
    # Set flash message
    flash[:notice] = 'Sessao encerrada com sucesso'
    # Redirect to home 
    redirect_to '/home'
  end
  
end