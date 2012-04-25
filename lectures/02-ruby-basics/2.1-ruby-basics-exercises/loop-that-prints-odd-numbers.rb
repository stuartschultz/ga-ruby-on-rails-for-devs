=begin

 Implement a loop that prints odd numbers under 10.

    1
    3
    5
    7
    9

=end

(1..10).each do |i|
  if i%2 != 0 
    puts i
  end
end
