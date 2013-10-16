class BadgesController < ApplicationController

  def show
    @badge = Badge.find(params[:id])
  end

  def submit
    @badge = Badge.find(params[:id])
  end

  def index
    if params[:claim]
      code = params[:claim]
      badge = Badge.where(code)[0]
      if badge && code != ""
        redirect_to claim_badge_path(badge), :method => :get and return
      else
        flash[:notice] = "Invalid Claim Code: #{code[:claimcode]}"
        redirect_to badges_path and return
      end
    end        
    @badges = Badge.all
    @badges = @badges.sort_by &:name
  end

  def all
    @badges = Badge.all
    @badges = @badges.sort_by &:name
  end

  def new
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def update
    @badge = Badge.find(params[:id])
    @badge.update_attributes!(params[:badge])
    flash[:notice] = "#{@badge.name} was successfully updated."
    redirect_to badge_path(@badge)
  end

  def create
    @badge = Badge.create!(params[:badge])
    flash[:notice] = "#{@badge.name} was successfully created."
    redirect_to all_badges_path
  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    flash[:notice] = "#{@badge.name} was deleted."
    redirect_to all_badges_path
  end

  def assert
    @badge = Badge.find(params[:id])
  end
  
  def claim
    @badge = Badge.find(params[:id])
  end

end
