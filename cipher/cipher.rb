=begin
Caesar's cipher
------------------------------------
Program will shift letters in string
based on the number the user enters
=end

puts "Enter the sentence you want encrypted."
sentence = gets.chomp

puts "Enter a number to shift"
number = gets.chomp
number = number.to_i

#Takes string and shifts letters based on input number
def caesar_cipher(sentence, number)
    sentence = sentence.split('').map { |ch|
        if ch != ' ' then
            (ch.ord + number).chr
        else
            ch.chr
        end
        }
 
    sentence = sentence.join
    puts sentence 
end

if(number >= 0 && number <= 26) then
    caesar_cipher(sentence, number)
else
    puts "Number must be between 0 and 26"
end
