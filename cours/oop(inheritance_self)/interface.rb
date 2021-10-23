require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'

simba = Lion.new("Simba")
puts simba.eats("a gazelle")
nala = Lion.new("Nala")
puts nala.eats("a gazelle")
pumbaa = Warthog.new("Pumbaa")
puts pumbaa.eats("an insect")
timon = Meerkat.new('Timon')
puts pumbaa.eats("an scorpion")

# [simba, nala, pumbaa, timon].each do |animal|
#   puts animal.talk
# end
