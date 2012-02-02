class SessionsController < ApplicationController
  def create
    @session = UserSession.new(:username => params[:username] , :password => params[:password])
    @session.save!
    session[:user_id] = @session.user.id
    flash[:notice] = "Welcome back #{@session.user.fname}!"
    redirect_to '/users/'

  rescue LetMeIn::Error
    flash.now[:error] = 'Invalid Credentials'
    render :action => :new
  end
  
  def new
    @session = UserSession.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
end