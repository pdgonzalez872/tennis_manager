class DrawsController < ApplicationController

  def index
    @draws = Draw.all
  end

  def show
    @draw = Draw.find(params[:id])
  end
end
