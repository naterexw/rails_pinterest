class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all.order('created_at DESC')
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      redirect_to @pin, notice: "Successfully created new pin"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Successfully updated the pin"
    else
      render 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path, notice: "Successfully deleted the pin"
  end

  private

  def find_pin
    @pin = Pin.find_by(params[:id])
  end

  def pin_params
    params.require(:pin).permit(:title, :description)
  end

end