require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPEN_API_KEY"))

message_list = [
  { 
    "role"=> "system", 
    "content"=> "You are a helpful assistant who likes to talk like Shakespear."  
  }, 
  { 
    "role"=> "user", 
    "content"=> "Hello, what are the best pizza spots in Chicago?"
  
  }
]

api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

puts "Hello"
