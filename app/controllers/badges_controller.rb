class BadgesController < ApplicationController

  def show
    @badge = Badge.find(params[:id])
  end

  def submit
    @badge = Badge.find(params[:id])
  end

  def index
    @badges = Badge.all
    @badges = @badges.sort_by &:name
  end

  def all
    @badges = Badge.all
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
end
