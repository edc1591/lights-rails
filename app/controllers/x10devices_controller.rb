class X10devicesController < ApplicationController
  def new
  	
  end

  def create
  	@device = X10device.new(params[:x10device])
  	@device.save
  end

  def edit
  	@device = X10device.find_by_id(params[:id])
  end

  def update
  	@device = X10device.find_by_id(params[:id])
  	@device.update(params[:x10device])
  	@device.save
  	redirect_to show
  end

  def index
    @devices = X10device.order(:id).page params[:page]
  end

  def show
  	@device = X10device.find_by_id(params[:id])
  end
end
