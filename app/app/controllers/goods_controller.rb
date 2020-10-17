class GoodsController < ApplicationController
  def search
  end

  def search_list
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword], genreId: 100984)
    end  
  end
end
