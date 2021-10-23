class PostsView
  # TODO: implement methods called by the PostsController

  def ask_for_stuff(stuff)
    puts "enter new #{stuff}"
    print ">"
    gets.chomp
  end

  def display(array)
    array.each { |row| puts "#{row.id}- #{row.title}: #{row.url}  --->>>#{row.votes}" }
  end

  def ask_for_id
    puts "select id to update"
    print ">"
    gets.chomp
  end
end
