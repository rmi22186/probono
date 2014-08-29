class MaintenanceCommentsController < ApplicationController
  def create
    @mr = MaintenanceRequest.find(params[:maintenance_request_id])
    @comments = @mr.maintenance_comments
    @comment = current_user.maintenance_comments.build(params[:maintenance_comment])
    @comment.maintenance_request = @mr
    if @comment.save
      flash[:notice] = "Your comment was created."
      redirect_to @mr
    else
      flash[:error] = "There was an error creating your comment. Please try again."
      render 'maintenance_requests/show'
    end
  end
end
