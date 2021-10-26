require_relative "recipe"

class ViewOnline

  def ask_for_research
    puts "Enter a recipe ."
    print ">"
    gets.chomp
  end

  def display_research(array)
    puts " save recipe ?"
    puts "press the index of recipe to save , 6 for exit"
    puts "1. #{array[0].text.strip} => #{array[5].text.strip}"
    puts "2. #{array[1].text.strip} => #{array[6].text.strip}"
    puts "3. #{array[2].text.strip} => #{array[7].text.strip}"
    puts "4. #{array[3].text.strip} => #{array[8].text.strip}"
    puts "5. #{array[4].text.strip} => #{array[9].text.strip}"
    puts "6. Exit"
    user_save = gets.chomp.to_i
  end

end
