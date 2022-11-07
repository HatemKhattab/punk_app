class HomeController < ApplicationController

  def search
    if params[:query].blank? 
      redirect_to root_path and return
    else
      response = ::ApiClients::PunkClient.new.search(params["query"])
      if response.status != 200
        @error_msg = "Searching didnt get any result, plz try another search term"
        return
      end
      @arr = response.body
    end
  end


  def index
     #todo handle eroor från api 
     #todo handle empty input
     
  end
  
end
