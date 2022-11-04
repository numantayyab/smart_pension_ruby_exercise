require_relative './lib/log_parser'

puts "Only first file will be parsed" if ARGV.length > 1
file = ARGV[0]
log_parser = LogParser.new(file)
log_parser.parse_logs

puts log_parser.most_views

puts "\n*******\n\n"

puts log_parser.uniq_views