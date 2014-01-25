class UsersController < ApplicationController
  doorkeeper_for :auth
  before_filter :authenticate_user!, except: [:auth, :new, :join]

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def join
    render layout: false
  end

  def auth
    user = User.find(doorkeeper_token.resource_owner_id)
    render json: {
      id: user.id,
      user: {
        id: user.id,
        admin: user.has_role?(:admin),
        has_active_subscription: user.subscribed?,  # lock out user if they cancel / fail charge
        cohort: user.cohort,
        name: user.name,
        email: user.email,
      }
    }
  end

  def new
    @user = User.new
    @free = params[:cohort] =~ /free/i
  end

  def create

  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    raise 'hi'
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    role = Role.find(params[:user][:role_ids]) unless params[:user][:role_ids].nil?
    params[:user] = params[:user].except(:role_ids)
    if @user.update_attributes(params[:user])
      @user.update_plan(role) unless role.nil?
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end