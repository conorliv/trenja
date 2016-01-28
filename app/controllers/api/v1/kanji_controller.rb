module Api
  module V1
    class KanjiController < ApiController

      # @resource /api/v1/trending
      # @action GET
      # @example_response
      #   ```json
      #   {
      #     {
      #       "kanji": "車",
      #       "count": 123
      #     },
      #     {
      #       "kanji": "今",
      #       "count": 120
      #     }
      #   }
      #   ```
      # @example_response_description Responds with a list of the top 10 trending kanji.
      def trending
        render json: Kanji.top(10)
      end

    end
  end
end

