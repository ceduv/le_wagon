class EmployeeView
  def wrong_password
    puts "no match"
  end

  def ask_for_stuff(stuff)
    puts "enter your #{stuff}"
    print ">"
    gets.chomp
  end
end
