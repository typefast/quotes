class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end
  
  def create
    @quote = Quote.create(quote_params)
    if @quote.save
      flash[:success] = "Quote Saved"
      redirect_to @quote
    else
      flash[:error] = "There was an error"
      render :new
    end
  end

  def show
    @quote = Quote.find(params[:id])
  end
  
  def upvote
    @quote = Quote.find(params[:id])
    @quote.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @quote = Quote.find(params[:id])
    @quote.downvote_by current_user
    redirect_to :back
  end
  
  private
    def quote_params
      params.require(:quote).permit(:quote, :author)
    end
end






