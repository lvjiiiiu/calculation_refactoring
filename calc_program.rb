require "./token_paser"
require "./token_calculator"

tokens = TokenPaser.new(ARGV.first).tokens
answer = TokenCalculator.new(tokens).calculate

puts answer





