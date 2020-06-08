class ReviewsController < ApplicationController

  before_action :find_review ,only: [:edit, :update, :destroy, :show]

  def show
  end

  def new
    @review=Review.new()
    @movie=Movie.find(params[:id])

  end

  def create
  
    review=Review.new(review_params)
    review.user_id=@current_user.id
    if review.save
      redirect_to movie_path(review.movie_id)
    else
      flash[:errors]=review.errors.full_messages 
      redirect_to movie_review_path(review.movie_id)
    end
  end

  def edit
    @movie=@review.movie
  end

  def update
    @review.update(review_params)
    if @review.valid?
      redirect_to movie_path(@review.movie.id)
    else      
      flash[:errors]=@review.errors.full_messages 
      redirect_to edit_review_path
    end
  end

  def destroy

    @review.destroy

    redirect_to  movie_path(@review.movie.id)
  end

  
  private

  def find_review
    @review=Review.find(params[:id])
  end


  def review_params
    params.require(:review).permit(:movie_id, :rating, :description, :likes)
  end




end
