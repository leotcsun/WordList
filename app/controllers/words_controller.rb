class WordsController < ApplicationController

  def new
  end

  def show
  end

  def create
    words = params[:words][:content].split(/\r?\n/)

    words.each do |w|
      next if w.strip.empty?

      pair = w.split(":")
      spelling, definition = pair[0].strip, pair[1].strip

      Word.create(:spelling => spelling, :definition => definition)
    end

    redirect_to :words
  end

  def index
    @words = Word.order(:spelling).all
  end

  def test
    order = params[:order] ? params[:order] : "RANDOM"

    case order
    when "ALPHA"
      @words = Word.order(:spelling).all
    else
      @words = Word.order("RANDOM()").all
    end
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
