class MaintenanceRequestsController < ApplicationController

  def new
    @mr = MaintenanceRequest.new
  end
  
  def create
    @mr = current_user.maintenance_requests.build(params[:maintenance_request])
    @mr.status = "Open"
    @mr.apartment ||= current_user.apartment
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
      @mainrequests = MaintenanceRequest.filter(params.slice(:status)).order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
    elsif current_user.apartment == nil
      @mainrequests = nil
    else
      apt_user_ids = current_user.apartment.users.ids
      @mainrequests = MaintenanceRequest.filter(params.slice(:status)).where(user_id: apt_user_ids).order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
  end
  
  def edit
  end
end

