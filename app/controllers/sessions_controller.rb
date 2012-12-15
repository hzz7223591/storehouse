class SessionsController < ApplicationController
  def new

  end
  def create
    user=User.find_by_name(params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to  root_path
    else
      flash[:error]="用户名或密码错误"
      redirect_to root_path
    end
  end
  def destroy

  end
end
