#=============================
#           CSS 

#-----------------------------
#          COLOR

color               =>  premier plan    
background-color    =>  arriere plan


#           HEXA

#FFF => white
#000 => black

#         HEX + RVB

#352926

#------------------------------
#          HSL

# 1er   => degre de teinte entre 1-360 (cf roue hsl)
# 2     => saturation en %
# 3     => luminosite en %

color: hsl( 120 , 60% , 70% );

#   En RVB, rendre la couleur un peu plus foncée 
#   peut affecter les trois composants de couleur.
#   HSL est utile pour créer un ensemble de
#   couleurs qui fonctionnent bien ensemble en
#   sélectionnant différentes couleurs qui ont
#   même luminosité même saturation teintes différentes.

#  hsla -> 4 eme parametre => alpha de 0->1

color: hsla( 120 , 60% , 70% , 0.1 );