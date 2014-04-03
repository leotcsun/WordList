class WordsController < ApplicationController

  def new
    @lists = List.all
  end

  def show
  end

  def create
    list_id = params[:words][:list_id]
    delimiter = params[:words][:delimiter]
    words = params[:words][:content].split(/\r?\n/)

    words.each do |w|
      next if w.strip.empty?

      pair = w.split(delimiter)
      spelling, definition = pair[0].strip, pair[1].strip

      Word.create(:spelling => spelling, :definition => definition, :list_id => list_id)
    end

    redirect_to :words
  end

  def index
    @words = Word.order(:spelling).all
  end

  def test
    list_id = params[:list_id]

    order = params[:order] ? params[:order] : "RANDOM"

    case order.upcase
    when "ALPHA"
      @words = Word.order(:spelling)
    when "TIME"
      @words = Word.order("DATE(created_at) DESC")
    else
      @words = Word.order("RANDOM()")
    end

    @words = @words.where(:list_id => list_id)
  end

  def edit_all
    @words = Word.order(:spelling).all
  end

  def update
    word = Word.where(:id => params[:id]).first

    puts "word is #{word.inspect}"

    word.spelling = params[:spelling]
    word.definition = params[:definition]
    word.save

    redirect_to :words
  end

end
