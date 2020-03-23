class WatchlistsController < ApplicationController
  def new
    @watchlist = Watchlist.new
  end

  def create
    @watchlist = Watchlist.create(watchlist_params)
    if @watchlist.valid?
      redirect_to @watchlist
    else 
      flash[:errors] = @watchlist.errors.full_messages
      redirect_to new_watchlist_path
    end
  end

  def destroy
    find_user.destroy
    redirect_to new_watchlist_path
  end

  private

  def watchlist_params
    params.require(:watchlist).permit!
  end
end
