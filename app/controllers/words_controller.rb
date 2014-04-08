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

    words.each do |word|
      next if word.strip.empty?

      if delimiter.blank?
        index = word.index(" ")
        pair = [word[0..index], word[(index+1)..word.size]]
      else
        pair = word.split(delimiter)
      end

      spelling, definition = pair[0].strip, pair[1].strip

      Word.create(:spelling => spelling, :definition => definition, :list_id => list_id)
    end

    redirect_to :controller => :words, :action => :index, :list_id => list_id
  end

  def index
    @words = Word.all
  end

  def test
    list_id = params[:list_id]

    order = params[:order] ? params[:order] : "RANDOM"

    @words = Word.where(:list_id => list_id)

    case order.upcase
    when "ALPHA"
      @words = @words.order(:spelling)
    when "TIME"
      @words = @words.order("DATE(created_at) DESC")
    else
      @words = @words.order("RANDOM()")
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
