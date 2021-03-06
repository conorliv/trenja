module Api
  module V1
    class KanjiController < ApiController

      # @resource /api/v1/kanji
      # @action GET
      # @example_response
      #   ```json
      #   {
      #     "trending": [
      #       {
      #         "kanji": "車",
      #         "count": 123
      #       },
      #       {
      #         "kanji": "今",
      #         "count": 120
      #       }
      #     ]
      #   }
      #   ```
      # @example_response_description Responds with a list of the top trending kanji.
      def index
        @kanji = Kanji.top(10)
      end

    end
  end
end

