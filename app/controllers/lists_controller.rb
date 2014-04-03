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

end
