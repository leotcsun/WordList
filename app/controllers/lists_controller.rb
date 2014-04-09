class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    name = params[:list][:name]
    List.create(:name => name)

    redirect_to :lists
  end

  def show
    order = params[:reverse] ? "DESC" : "ASC"

    @list = List.find(params[:id])
    @words = @list.words.order("spelling #{order}")
  end

  def test
    @list = List.find(params[:id])
    @words = @list.words

    order = params[:order] ? params[:order] : "RANDOM"

    case order.upcase
    when "ALPHA"
      @words = @words.order(:spelling)
    when "TIME"
      @words = @words.order("DATE(created_at) DESC")
    else
      @words = @words.order("RANDOM()")
    end
  end

end
