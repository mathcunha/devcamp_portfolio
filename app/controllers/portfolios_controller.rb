class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  layout "portfolio"
  load_and_authorize_resource

  def index
    @portfolios = Portfolio.all.order(position: :asc)
  end

  def angular
    @portfolios = Portfolio.dathomirian
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(key[:data][:id]).update(position: key[:data][:position])
    end

    respond_to do |format|
      format.json { render json: Portfolio.new, status: :ok}
    end
  end

  def new
    @portfolio = Portfolio.new
    3.times {@portfolio.technologies.build}
  end  

  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio item is now live.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes:[:name])
    end
end
