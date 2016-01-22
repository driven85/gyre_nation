class UsersController < ApplicationController

  before_action :set_user, only: :show

  def show
    unless signed_in? && ( current_user.id == params[:id].to_i )
      redirect_to root_path
    end
  end

  def new
    unless signed_in?
      @user = User.new
    else
      redirect_to current_user
    end
  end

  def create
    @user = User.new( user_params )

    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def set_user
      @user = User.find( params[:id] ) rescue( redirect_to root_path )
    end

    def user_params
      params.require( :user ).permit( :name, :email, :password, :password_confirmation )
    end

end

