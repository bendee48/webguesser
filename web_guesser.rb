require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(1..100)

get '/' do
  guess = params['guess'].to_i - SECRET_NUMBER
  msg, background = check_guess(guess)
  erb :index, :locals => { :number => SECRET_NUMBER, :msg => msg,
                           :background => background
                         }
end

def check_guess(guess)
  if guess == 0
    return ["Yes. The secret number is #{SECRET_NUMBER}!", "#06b004"]
  elsif guess > 5
    return ["Guess is way too high.", "#ff031c"]
  elsif guess < 5 && guess > 0
    return ["Guess is too high.", "#ff99a3"]
  elsif guess < 0 && guess > -5
    return ["Guess is too low.", "#ff99a3"]
  else
    return ["Guess is way too low.", "#ff031c"]
  end
end