class ReviewsController < ApplicationController

  before_action :find_review ,only: [:show, :edit, :update, :destroy]

  def new
    @review=Review.new()
  end

  def create
    review=Review.create(review_params)
    if review.valid?
      redirect_to review
    else
      flash[:error]=review.errors.full_messsages 
      redirect_to reviews_new_path
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    if @review.valid?
      redirect_to reviews_show_path
    else      
      flash[:error]=@review.errors.full_messsages 
      redirect_to reviews_edit_path
    end

  end

  def destroy
    @review.destroy
    redirect_to reviews_show_path(@review.users.id)
  end

  def index
    @reviews=Review.all
  end

  def show
    @movies=Movie.all
    @users=User.all
  end
  
  private

  def review_params
    params.require(:review).permit!
  end

  def find_review
    @review=Review.find(params[:id])
  end

end
