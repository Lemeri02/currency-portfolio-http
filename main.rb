require 'net/http'
require 'uri'
require 'rexml/document'
require_relative 'lib/currency'
require_relative 'lib/currency_unit'
require_relative 'lib/budget'

uri = URI.parse('http://www.cbr.ru/scripts/XML_daily.asp')

begin
  response = Net::HTTP.get_response(uri)
rescue SocketError => e
  puts "Похоже, Интернет-соединение было прервано (#{e.class})"
  puts e.message
  exit
end

doc = REXML::Document.new(response.body)

currency = Curency.from_xml(doc)

unit = currency.unit

puts 'Бивалютный портфель. v.2.0.0'
puts "Курс #{unit.char_code}: #{unit.value}"

puts 'Сколько у вас рублей?'
rubs = gets.to_f

puts 'Сколько у вас долларов?'
dollars = gets.to_f

budget = Budget.new(unit.value, rubs, dollars)

puts budget
