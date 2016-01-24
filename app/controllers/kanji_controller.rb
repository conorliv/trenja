class KanjiController < ApplicationController

  def index
    @kanji = Kanji.all.sort_by { |kanji| kanji.count }.reverse
  end

end
