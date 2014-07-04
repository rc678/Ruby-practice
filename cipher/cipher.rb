=begin
Caesar's cipher
------------------------------------
Program will shift letters in string
based on the number the user enters
=end

#global variables
$lcase = ('a'..'z').to_a
$ucase = ('A'..'Z').to_a
$number = 0

puts "Enter the sentence you want encrypted."
sentence = gets.chomp

puts "Enter a number to shift"
number = gets.chomp
$number = number.to_i

#shifts to encoded letter
def encrypt(char)
    if $lcase.include?(char)
        i = ($lcase.index(char) + $number) % 26
        return $lcase[i]  
    elsif $ucase.include?(char)
        i = ($ucase.index(char) + $number) % 26
        return $ucase[i]
    else
        return char
    end
end

#Takes string and shifts letters based on input number
def caesar_cipher(sentence)
    sentence = sentence.split('').map { |ch|
        if ch != ' ' then
            encrypt(ch)
        else
            ch.chr
        end
        }
 
    sentence = sentence.join
    puts sentence 
end

if($number >= 0 && $number <= 25) then
    caesar_cipher(sentence)
else
    puts "Number must be between 0 and 26"
end
