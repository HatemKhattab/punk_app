class HomeController < ApplicationController

  def search
    redirect_to root_path  if params[:query].blank? 
    response = ::ApiClients::PunkClient.new.search(params[:query])
    if response.status != 200 || response.body.size == 0
      flash[:notice] = "Searching didnt get any result, plz try another search term"
      return
    end
    @view = response.body.paginate(page: params[:page], per_page: 10)
  end

  def show
    response = ::ApiClients::PunkClient.new.get_beer(params[:id])
    @view = response.body.first
  end

  def index
  end
end
