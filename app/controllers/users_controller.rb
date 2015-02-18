class UsersController < ApplicationController
  def new
  @user = User.new
end

def create
  @user = User.new(params[:user])
  if @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
    render "new"
  end
end

before_action do  
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
end 

private

  def user_params
    params.require(:user).permit(:user, :email, :password)
  end
end
