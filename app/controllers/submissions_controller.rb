class SubmissionsController < ApplicationController

  def show
    id = params[:id] # retrieve submission ID from URI route
    @submission = Submission.find(id) # look up submission by unique ID
    # will render app/views/submission/show.<extension> by default
  end

  def index
    @submissions = Submission.all
    @all_badges = Submission.all_badges
    @checked = @all_badges
    if params[:badges]
      session[:badges] = params[:badges]
    end
    if params[:sort]
      session[:sort] = params[:sort]
    end
    if (!params[:badges] || !params[:sort]) && (session[:badges] && session[:sort])
      flash.keep
      redirect_to submissions_path(:badges => session[:badges], :sort => session[:sort]) and return
    end
    if (!params[:badges] && session[:badges])
      flash.keep
      redirect_to submissions_path(:badges => session[:badges]) and return
    end
    if (!params[:sort] && session[:sort])
      flash.keep
      redirect_to submissions_path(:sort => session[:sort]) and return
    end
    if session[:badges]
      @checked = session[:badges].keys
      @submissions = Submission.where(:badge => @checked)
    end
    if session[:sort] == "name"
      @submissions = @submissions.sort_by &:name
      @name_class = "hilite"
    end
    if session[:sort] == "badge"
      @submissions = @submissions.sort_by &:badge
      @badge_class = "hilite"
    end
    if session[:sort] == "status"
      @submissions =  @submissions.sort_by &:status
      @status_class = "hilite"
    end
    if session[:sort] == "date"
      @submissions = @submissions.sort_by &:date
      @date_class = "hilite"
    end
  end

  def create
    params[:submission][:date] = Time.now
    params[:submission][:status] = "Pending"
    @submission = Submission.create!(params[:submission])
    flash[:notice] = "Your submission was successfully created."
    redirect_to badges_path
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    flash[:notice] = "#{@submission.name}'s submission deleted."
    redirect_to submissions_path
  end

  def approve
    @submission = Submission.find(params[:id])
    @submission.status = "Approved"
    @submission.save!
    flash[:notice] = "#{@submission.name}'s submission was approved."
    redirect_to submissions_path 
  end
  
  def reject
    @submission = Submission.find(params[:id])
    @submission.status = "Rejected"
    @submission.save!
    flash[:notice] = "#{@submission.name}'s submission was rejected."
    redirect_to submissions_path
  end

  def assert
    @submission = Submission.find(params[:id])
    if (@submission.status == "Approved")
      @badge = Badge.where(:name => @submission.badge)[0]
    else
      flash[:warning] = "This submission has not been approved"
      redirect_to submissions_path
    end
  end
  
  def push
    @submission = Submission.find(params[:id])
  end

  def claim
    submission = Submission.create!(params[:submission])
    submission.date = Time.now
    submission.status = "Approved"
    submission.description = "Claim Code"
    submission.save!
    redirect_to push_submission_path(submission)
  end
end
