class MaintenanceRequestsController < ApplicationController

  def new
    @mr = MaintenanceRequest.new
  end
  
  def create
    @mr = current_user.maintenance_requests.build(params[:maintenance_request])
    @mr.status = "open"
    if @mr.save
      flash[:notice] = "You have submitted a maintenance request."
      redirect_to @mr
    else
      flash[:error] = "There was an error submitting your maintenance request. Please try again."
      render :new
    end
  end
  
  def index
    if current_user.role == "admin"
      @mainrequests = MaintenanceRequest.all
    elsif current_user.apartment == nil
      @mainrequests = nil
    else
      apt_user_ids = current_user.apartment.users.ids
      @mainrequests = MaintenanceRequest.where(user_id: apt_user_ids)
    end
  end

  def show
  end
  
  def edit
  end
end

