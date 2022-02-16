# spec/integration/greetings_spec.rb
require 'swagger_helper'

describe 'Greetings API' do
  path '/api/v1/random' do
    get 'Retrieves a random message' do
      tags 'Pets'
      produces 'application/json', 'application/xml'
      parameter name: :message, in: :path, type: :string

      response '200', 'message found' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               },
               required: ['message']

        let(:message) { Greeting.create(message: 'Wake up!!!').message }
        run_test!
      end

      response '404', 'message not found' do
        let(:message) { 'invalid' }
        run_test!
      end
    end
  end
end
