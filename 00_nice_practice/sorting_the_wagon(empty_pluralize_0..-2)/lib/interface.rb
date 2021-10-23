require_relative "wagon_sort"
#       - `gets`:  http://www.ruby-doc.org/core-2.5.3/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.5.3/String.html#method-i-chomp

students  = []
name      = nil

while name != ""
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets.chomp

  students << name if name != ""
end

sorted_students = wagon_sort(students)
num_students = sorted_students.size

# on passe "n" pour definir si on met un "s" ou non
def pluralize(n, word)
  n == 1 ? "#{word}" : "#{word}s"
end

puts "Congratulations! Your Wagon has #{num_students} #{pluralize(num_students, "student")}:"
if sorted_students.size >= 2
# si on a plus d un eleve
  puts "#{sorted_students[0..-2].join(', ')} and #{sorted_students.last}"
  # on prend tous les eleves jusqua l avant dernier
  # puis on isole le dernier
else
  puts sorted_students.first
end