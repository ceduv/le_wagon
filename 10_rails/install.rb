#========== GEM ============

#--------------
#   Rails

gems install rails -v 6.0
rails --version

#---------------

# new projet
rails new first-rails-app --skip-active-storage --skip-action-mailbox

-T          # n install pas les test

# first commit rails
git add . && git commit -m "rails new"

# cree repo

gh repo create
git remote -v           # An `origin` remote is now set!
git push origin master  # Push the generated rails app to GitHub
gh repo view --web      # Will open your browser to the new directory