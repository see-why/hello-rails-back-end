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

      def add
        @new_message = Greeting.new(greeting_params)
        if @new_message.save
          render json: {
            message: 'Successfully added'
          }.to_json
        else
          render json: {
            message: 'Save failed'
          }.to_json
        end
      end

      private

      def greeting_params
        params.permit(:message)
      end
    end
  end
end
