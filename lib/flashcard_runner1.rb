require_relative 'card'
require_relative 'deck'
require_relative 'turn'
require_relative 'round'
require_relative 'card_generator'

filename = "cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  count = 1
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts '-------------------------------------------------'
  while count <= round.deck.count
    puts "\nThis is card number #{count}"
    puts round.deck.cards.first.question
    guess = gets.chomp
    puts round.take_turn(guess).feedback?
    count += 1
  end
  puts "****** Game over! ******"
  puts "You had #{round.number_correct} out of #{round.deck.count} for a total score of #{round.percent_correct}%"
  puts "STEM - #{round.number_correct_by_category(:STEM)}% correct"
  puts "Culture - #{round.number_correct_by_category(:Culture)}% correct"
  puts "Geography - #{round.number_correct_by_category(:Geography)}% correct"
end

#require 'pry'; binding.pry

start(round)
