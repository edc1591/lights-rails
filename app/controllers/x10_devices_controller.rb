class X10devicesController < ApplicationController
  def new
  	@device = X10Device.new
  end

  def create
  	@device = X10Device.new(params[:x10device])
  	@device.save
  	redirect_to '/x10devices'
  end

  def edit
  	@device = X10Device.find_by_id(params[:id])
  end

  def update
  	@device = X10Device.find_by_id(params[:id])
  	@device.update(params[:x10device])
  	@device.save
  	redirect_to '/x10devices'
  end

  def index
    @devices = X10Device.order(:id).page params[:page]
  end

  def show
  	@device = X10Device.find_by_id(params[:id])
  end
end
