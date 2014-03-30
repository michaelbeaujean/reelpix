class TitlesController < ApplicationController

  def index
  end

  # def search
  #   @title_name = params[:title_name]
  #     if @title_name
  #      redirect_to("#{base_url}search/media/#{@title_name}/us/")
  #     else
  #      render(:new)
  #     end
  # end

  def new
    @title_name = params[:title_name]
    @title_search = Title.search
  end

  def create
  end

  def show
    @base_url = "http://staging-api-us.crackle.com/Service.svc/"
    @title_name = params[:title_name]
    response = HTTParty.get("#{@base_url}search/media/#{@title_name}/us/")
    @title = response["CrackleItemList"]["Items"]["CrackleItem"][0]["Title"]
  end
end
