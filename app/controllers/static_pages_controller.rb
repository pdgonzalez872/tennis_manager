class StaticPagesController < ApplicationController

  def index
    @tournaments = Tournament.all
  end
end
