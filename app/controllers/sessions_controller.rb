class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Login successfully"
      redirect_to user
    else
      flash.now[:notice] = "There was something wrong with your login detail"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Log out successfully"
    redirect_to root_path, status: :see_other
  end
end
