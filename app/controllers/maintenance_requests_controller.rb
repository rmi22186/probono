class MaintenanceRequestsController < ApplicationController

  def new
    @mr = MaintenanceRequest.new
    authorize! :create, MaintenanceRequest, message: "You must be logged in to create a maintenance request."
  end
  
  def create
    @mr = current_user.maintenance_requests.build(params[:maintenance_request])
    authorize! :create, MaintenanceRequest, message: "You must be logged in to create a maintenance request."
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
    if current_user
      if current_user.role == "admin"
        @mainrequests = MaintenanceRequest.filter(params.slice(:status)).order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
      elsif current_user.apartment == nil
        @mainrequests = nil
      else
        apt_user_ids = current_user.apartment.users.ids
        @mainrequests = MaintenanceRequest.filter(params.slice(:status)).where(user_id: apt_user_ids).order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
      end
    end
    authorize! :read, MaintenanceRequest, message: "You must be logged in to view maintenance requests."
  end

  def show
    @mr = MaintenanceRequest.find(params[:id])
    authorize! :read, @mr, message: "You can only view maintenance requests associated to your apartment."
  end
  
  def edit
    @mr = MaintenanceRequest.find(params[:id])
    authorize! :edit, @mr, message: "You can only view maintenance requests associated to your apartment."
  end

  def update
    @mr = MaintenanceRequest.find(params[:id])
    authorize! :update, @mr, message: "You can only view maintenance requests associated to your apartment."
    if @mr.update_attributes(params[:maintenance_request])
      flash[:notice] = "Your maintenance request has been updated."
      redirect_to @mr
    else
      flash[:error] = "There was an error updating your maintenance request. Please try again."
      render :edit
    end
  end

end

