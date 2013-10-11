class BadgesController < ApplicationController

  def show
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

  def create
    @badge = Badge.create!(params[:badge])
    flash[:notice] = "#{@badge.name} was successfully created."
    redirect_to all_badges_path
  end
end
