#!/usr/bin/env ruby
#pgen


if ARGV.empty?
  puts "This is a simple number puzzle where an entered number is added to its reversed order \n"
  puts "and tested if it's a palindrome.  If not, continue the pattern of summing up the net with its reverse  \n"
  puts "till a either 100 iterations are passed or a palindrome is found.\n\n"
  puts "You need to enter a number like: 'ruby pgen.rb 195'. ...to get 9339"
  puts "...but no number entered. So I'm quitting.\n\n"
  exit 0
end

@number = ARGV[0].to_i
@palindrome = ""
@isSuccessful = false


# -------------------------------------------------

def isPalindrome(num)
  word = num.to_s
  x = 0
  y = word.length-1
  
  middleIndex = word.length/2
  matched = false
  
  until (x == middleIndex) do
      leftChar = word[x]
      rightChar = word[y]
      matched = (word[x] == word[y])
      x = x + 1
      y = y - 1
  end
  @palindrome = word
  return matched
end
 
# -------------------------------------------------  
# Example:
# 195
# 591 -- reverse number & add
# 786 -- check for palindrome
# -------------------------------------------------

myNum = @number
counter = 1

while counter < 100
  revNum = myNum.to_s.split('').reverse.join.to_i
  netNum = revNum + myNum
  print "#{counter}) Net Number: #{netNum}\n"
  myNum = netNum
  
  if isPalindrome(myNum) 
    @isSuccessful = true
    print "\nPalindrome found: #{@palindrome}"
    break
  end
  counter = counter + 1
end

if !@isSuccessful 
  print "\n --- Sorry: no Palindrome generated from #{@number}.\n\n"
end
print "\nThe End.\n\n"

