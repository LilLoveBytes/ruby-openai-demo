require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPEN_API_KEY"))
user_request = ""
message_history = []

while user_request.downcase != 'bye'

  puts "Hello! How can I help you today?"
  puts "-" * 50
  user_request = gets.chomp
 
  message_history.push({ "role"=> "user", "content"=> user_request})

  api_response = client.chat(
    parameters: {
      model: "gpt-3.5-turbo",
      messages: message_history
    }
  )
  chat_response = api_response['choices'][0]['message']['content']
  puts chat_response

  puts "-" * 50

  message_history.push({ "role"=> "assistant", "content"=> chat_response})
  end
