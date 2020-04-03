require 'sinatra'
require 'sinatra/reloader'

number = rand(1..100)

get '/' do
  "The secret numero is #{number}."
end