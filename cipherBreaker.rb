def cipherType
puts "What cipher system do you want to brute?"
puts "1.Caeser(shift)"
puts "1.Character Camoflage"
input = gets.chomp
case(input)
when "1"
  ceaserBreaker
when "2"
  characterCamoflage
else
  puts "Incorrect input"
  cipherType
end
end

def ceaserBreaker
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  spacer=" "
  alphArray=alphabet.split("")
puts "Enter your message"
message = gets.chomp
message.downcase!
puts "What word is in there?"
inMessage= gets.chomp
inMessage.downcase!
mess=message.split("")
i=0
string=""
alphArray.each do |x|
  mess.each do |character|
    if alphArray.include?(character)
    position = alphArray.index(character)
    string=string+ alphArray[(position-i)%alphArray.length]
  elsif spacer.include?(character)
    string = string + " "
  end
end
  i=i+1
  if string.include?(inMessage)
    puts string
  end
  string=""
end
end

def sequence(n)
  [0, 1].repeated_permutation(n).to_a
end

def characterCamoflage
puts "How many characters long is the word?"
wordLength= gets.chomp
camoWord = Array.new(wordLength.to_i)
for i in 0...wordLength.to_i
  puts"What are the two characters? (#{i+1})"
  camoWord[i] = gets.chomp
end

camoWordSplit = Array.new(wordLength.to_i){Array.new(2)}
for i in 0...wordLength.to_i
camoWordSplit[i] = camoWord[i].split("")#create 2d array of characters
end

numbers = sequence(wordLength.to_i)
for ii in 0...(2**wordLength.to_i)
for i in 0...wordLength.to_i
  print camoWordSplit[i][numbers[ii][i]]#plug binary in to 2d array of characters
end
puts ""
end
end

cipherType
