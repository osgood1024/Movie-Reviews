class WatchlistsController < ApplicationController

  def new
    @watchlist = Watchlist.new()
  end

  def create
    @watchlist = Watchlist.new(watchlist_params)
    @watchlist.user_id=@current_user.id

    if @watchlist.save
      redirect_to user_path(@watchlist.user.id)
    else 
      flash[:errors] = @watchlist.errors.full_messages
      redirect_to movies_path
    end
  end

  def destroy
    watchlist = Watchlist.find(params[:id])
    watchlist.destroy
    redirect_to user_path(watchlist.user)
  end

  private

  def watchlist_params
    params.require(:watchlist).permit(:movie_id, :user_id)
  end
end
