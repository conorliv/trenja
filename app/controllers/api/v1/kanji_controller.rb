module Api
  module V1
    class KanjiController < ApiController

      def trending
        @sources = Source.all

        render json: @sources
      end

    end
  end
end

