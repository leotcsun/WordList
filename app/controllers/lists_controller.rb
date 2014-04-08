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

end
