require 'sinatra'
require 'sinatra/reloader'

@@secret_number = rand(1..100)
@@guesses = 6

get '/' do
  guess = params['guess'].to_i - @@secret_number
  msg, background = check_guess(guess)
  win_msg = check_for_win(guess)
  @@guesses -= 1
  erb :index, locals: { number: @@secret_number, msg: msg,
                        background: background, guesses: @@guesses,
                        win_msg: win_msg }
end

def check_guess(guess)
  if guess.zero?
    ["Yes. The secret number is #{@@secret_number}!", '#06b004']
  elsif guess > 5
    ['Guess is way too high.', '#ff031c']
  elsif guess.positive? && guess < 5
    ['Guess is too high.', '#ff99a3']
  elsif guess.negative? && guess > -5
    ['Guess is too low.', '#ff99a3']
  else
    ['Guess is way too low.', '#ff031c']
  end
end

def check_for_win(guess)
  if guess.zero?
    generate
    "New scret number generated. Let's go again."
  elsif @@guesses == 1
    generate
    "That's the end of the road. New number generated. Try again."
  end
end

def generate
  @@secret_number = rand(1..100)
  @@guesses = 6
end
