#=============================
#           CSS 

#-----------------------------
#         POSITION

#        PROPRIETES

POSITION
DISPLAY 
Z-INDEX 
FLOAT 
CLEAR 

#---
# POSITION

STATIC      ->      DEFAUT 
ABSOLUT     ->      EPINGLER
RELATIVE    ->      EN FONCTION DE L ABSOLU / SINON DU BODY
FIXED       ->      RESTE MEME SI DEFILEMENT
STICKY      ->      CONSERVER DS LE FLUX
                    SI DEFILE D AVANTAGE RESTE A SA PLACE


#---
# DISPLAY

INLINE  ->      DEFAUT
[1][2][3]       #   box entoure le contenu etroitement
                #   pas de nouvelle ligne apres chaque elements
                # *** ni widht ni height

BLOCK   =>      PREND TOUTE LA LARGEUR
[  1  ]         # width peut etre definit
[  2  ]         # sauf indication ils ont la hauyeur du contenu

INLINE-BLOCK    =>  INLINE + BLOCK
[ 1 ][ 2 ]      #   en ligne width/height ok


#---
# INDEX-Z

#couche de contenu prio si superposition 
#par defaut valeur = 0
# ne fonctionne pas sur les elements static


#---
# FLOAT

# decaler un element a gauche ou a droite
float: right;


#---
# CLEAR

# avec float des elements peuvent se heurter
    # clear => comment ils se comportent
clear:left;  # coté gauch ne touchera aucun element du conteneur  
      right; # coté droit
      both;  # aucun des cotés
      none;  #  l element peut toucher


#------------------------------
#         CENTER

width: 700px;
margin: auto;

#---

line-height    # hauteur de ligne

#---

margin: 0 auto;
#   centre horizontalement un élément à l'intérieur de sa zone
#    de contenu parent, s'il a une largeur.

#------------------------------
#          ALIGN
#   H
justify-content
#   V
align-items

