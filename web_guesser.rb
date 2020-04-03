require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(1..100)

get '/' do
  guess = params['guess'].to_i - SECRET_NUMBER
  msg = check_guess(guess)
  erb :index, :locals => { :number => SECRET_NUMBER, :msg => msg }
end

def check_guess(guess)
  if guess == 0
    return "Yes. The secret number is #{SECRET_NUMBER}!"
  elsif guess > 5
    return "Guess is way too high."
  elsif guess < 5 && guess > 0
    return "Guess is too high."
  elsif guess < 0 && guess > -5
    return "Guess is too low."
  else
    return "Guess is way too low."
  end
end