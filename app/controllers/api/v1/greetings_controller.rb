# frozen_string_literal: true

module Api
  module V1
    # api/v1/endpoint
    class GreetingsController < ApplicationController
      # Get /api/v1/random
      def random
        offset = rand(1..Greeting.count)
        @greeting = Greeting.find(offset)
        render json: {
          message: @greeting.message.to_s
        }.to_json
      end
    end
  end
end
