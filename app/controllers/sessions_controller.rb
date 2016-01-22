class SessionsController < ApplicationController

  def new
    redirect_to( current_user ) if signed_in?
  end

  def create
    user = User.find_by_email( session_params[:email] )

    if user && user.authenticate( session_params[:password] )
      sign_in user
      redirect_to user
    else
      # flash[:error] = "Неправильный логин или пароль"
      @error = "Неправильный логин или пароль"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

    def session_params
      params.require( :session ).permit( :email, :password )
    end

end
