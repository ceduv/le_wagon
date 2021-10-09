# ENCRYPT SENTECE => -3 letters D => A

def encrypt(text)
  return "" if text == "" # on gere string vide
  alpha = ("A".."Z").to_a # array de toute les lettres
  encrypt_letters = text.chars.map do |char|
  # chars permet de faire un tableau de toute les lettres
  # on map dessus
    alpha.include?(char) ? alpha[alpha.index(char) - 3] : char
    # si le tableau include char
  end
  encrypt_letters.join
end

p encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG!!")
