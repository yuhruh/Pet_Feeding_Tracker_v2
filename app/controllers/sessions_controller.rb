class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate_password(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_to '/favorites'
    else
      flash.now[:alert] = "Invalid usesrname or Password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully!!"
    redirect_to root_path
  end
end
