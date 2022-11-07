class HomeController < ApplicationController

  def search
    if params[:query].blank? 
      redirect_to root_path
    else
      response = ::ApiClients::PunkClient.new.search(params[:query])
      if response.status != 200 || response.body.size==0
        @error_msg = "Searching didnt get any result, plz try another search term"
        redirect_to root_path
      end
      arr = response.body
      @view=arr.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    response = ::ApiClients::PunkClient.new.get_beer(params[:id])
    @view = response.body.first
  end

  def index
     #todo handle eroor från api 
     #todo handle empty input 
  end


  
end
