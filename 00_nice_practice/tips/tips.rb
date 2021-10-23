#========== SOME TIPS ==============

#             RUBY


# is_set?

brigrade.instance_variable_get(:@name)
# "la brigade"
brigrade.instance_variable_get(:@true)
# nil

#------------------------------------

.nil?
.empty?
.blanck?    # return true sur "nil" ou "false"

#------------------------------------

print ">"
print `clear`

#--------------------------------------

# transform les strings d un hash en symbol
hash.transform_keys! { |key| key.to_sym }