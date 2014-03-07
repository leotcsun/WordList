class WordsController < ApplicationController

  def new
  end

  def create
    words = params[:words][:content].split(/\r?\n/)

    words.each do |w|
      pair = w.split(":")
      spelling, definition = pair[0].strip, pair[1].strip

      Word.create(:spelling => spelling, :definition => definition)
    end

    redirect_to :words
  end

  def index
    @words = Word.all
  end

end
