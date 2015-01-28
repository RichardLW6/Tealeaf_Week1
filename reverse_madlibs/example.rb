

dictionary = {

  nouns: ['dog', 'car', 'clown', 'hat'],
  verbs: ['juggle', 'spin'],
  adjectives: ['giant', 'red']

}



def say(msg)
  puts "=> #{msg}"
end

if ARGV.empty?
  puts "No input file!"
  exit
end

def exit_with(msg)
  say msg
  exit
end


exit_with("No input file!") if ARGV.empty?
exit_with("Input file doesn't exist!") if !File.exists?(ARGV[0])

contents = File.open(ARGV[0], 'r') do |f|
  f.read
end


# contents.gsub!('NOUN', dictionary[:nouns].sample)

contents.gsub!('NOUN').each do |noun|
  # dictionary[:nouns].sample
  puts "Input a NOUN:"
  STDIN.gets.chomp
end

contents.gsub!('VERB').each do |verb|
  dictionary[:verbs].sample
end

contents.gsub!('ADJECTIVE').each do |adjective|
  dictionary[:adjectives].sample
end

p contents

exit

contents.gsub!('VERB', dictionary[:verbs].sample)
contents.gsub!('ADJECTIVE', dictionary[:adjectives].sample)

p contents







