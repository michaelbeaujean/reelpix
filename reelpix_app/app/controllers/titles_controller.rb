class TitlesController < ApplicationController

  def index
  end

  def new
    @title_name = params[:title_name]
  end


end
