class Admin::DashboardController < ApplicationController
  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all
    end
    authorize! :read, User
  end
end
