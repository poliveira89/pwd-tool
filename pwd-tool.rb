#!/usr/bin/env ruby
# @author paulonascimento89@gmail.com
# @version 1.0
# @note pwd-tool - Password Generator Tool

require 'getoptlong'

def usage()
	puts "Usage: ./pwd-tool.rb [options]"
	puts "Options:"
	puts "   -h, --help\tshow help"
	puts "   -u, --upper\tspecifies if uses uppercase or not"
	puts "   -n, --number\tspecifies the size of suggestion list"
	puts "   -s, --size\tspecifies the size of password"
	puts "   -d, --digit\tspecifies if uses digits or not"
	puts "   -m, --meta\tspecifies if uses meta-characters or not"
	puts "\nExample: ./pwd-tool --number 5 --size 8 --meta"
	exit
end

opts = GetoptLong.new(
  [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
  [ '--upper', '-u', GetoptLong::NO_ARGUMENT ],
  [ '--number', '-n', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--size', '-s', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--digit', '-d', GetoptLong::NO_ARGUMENT ],
  [ '--meta', '-m', GetoptLong::NO_ARGUMENT ]
)

alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
uppercase = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
special = ['+', '-', '/', '*', '_', '|', '!', '"', '@', '#', '$', '%', '&', '(', ')', '=', '?', '«', '»', '<', '>']
upper = false
number = 1
size = 6
digit = false
meta = false
password = nil

opts.each do |opt, arg|
	case opt
		when '--help' then usage
		when '--upper' then upper = true		
		when '--number' then number = arg.to_i
		when '--size' then size = arg.to_i
		when '--digit' then digit = true
		when '--meta' then meta = true
	end
end

puts "\n################################################"
puts "#                                              #"
puts "#  pwd-tool - Password Generator Tool on Ruby  #"
puts "#  Version 1.0                                 #"
puts "#                                              #"
puts "################################################"
puts "\n\t- Nº of Suggestions: #{number};
      \t- Size of Password: #{size};
      \t- With Uppercase: #{upper ? 'yes' : 'no'};
      \t- With digits: #{digit ? 'yes' : 'no'};
      \t- With Meta-Characters: #{meta ? 'yes' : 'no'}.\n\n"

alphabet.concat uppercase if upper
alphabet.concat digits if digit
alphabet.concat special if meta

for i in 1..number
	password = ""
	for j in 1..size
		password += alphabet[rand(alphabet.length)]
	end
	puts "\t#{i}\t#{password}"
end

puts "\n\n################################################\n"
