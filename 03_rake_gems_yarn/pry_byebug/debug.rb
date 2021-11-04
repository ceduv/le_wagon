#============== PRY BYE BUG ===============

gem install pry-byebug

require "pry-byebug"

binding.pry     # BREAK POINT

# on peut mettre plusieurs binging.pry

continue        # next breakpoint 
next            # next line  
step            # rentrer ds la methode  
help            # list les methods 
whereami        # ou j en suis
reload-code     # reload

# *** ne pas push de binding.pry