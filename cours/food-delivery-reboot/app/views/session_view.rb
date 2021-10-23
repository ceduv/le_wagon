class SessionView
  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

  def wrong_credentials
    puts "Wrong credentials..."
  end
end
