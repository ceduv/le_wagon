#============ PRY BYEBUG ===================

La méthode la plus simple consiste à ajouter la pry-byebuggemme
(vous pouvez vous débarrasser de celle par défaut à byebugpartir de rails new)
et à ajouter binding.pryvotre code de contrôleur. De cette façon, vous pouvez suspendre
la requête Rails dans le terminal, inspecter et taper nextpour exécuter la ligne suivante
ou continuepour terminer le rendu de la vue.

# Gemfile

# [...]
group :development, :test do
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
end
Vous devez bundle installet redémarrer rails spour que cette modification prenne effet.