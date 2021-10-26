def french_phone_number?(phone_number)
  # TODO: true or false?
  phone_number.match?(/^(\+33|0)(-| )*[1-9]((-| *)\d{2}){4}$/)
end
# ^(\+33|0) # debut +33 ou 0
# (-| )*    # tiret ou espace 0 ou n x ( ? present une x ou non )
# [1-9]     # range
# ((-| *)\d{2}){4}$ # patern espace+2chiffers *4
