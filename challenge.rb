require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPEN_API_KEY"))


while user_request.downcase != 'bye'

  puts "Hello! How can I help you today?"
  puts "-" * 50
  user_request = gets.chomp

  api_response = client.chat(
    parameters: {
      model: "gpt-3.5-turbo",
      messages: [
        {
          "role"=> "user",
          "content"=> user_request
        }
      ]
    }
  )
  puts api_response['choices'][0]['message']['content']

  puts "-" * 50
