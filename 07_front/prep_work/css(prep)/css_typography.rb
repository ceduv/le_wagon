#=============================
#           CSS 

#-----------------------------
#        TYPOGRAPHY

font-family: Arial;
font-family: 'Times New Roman'; # '' si espace ds la police


#-----------------------------
#        PILE DE POLICE

h1 {font-family: Caslon, Georgia, 'Times New Roman';}
# georgia et times sont des polices de secours pour caslon 
#   priorité --> 2 --> 3 


#-----------------------------
#        FONT-WEIGHT

font-weight:    bold;   # police gras
                bolder  # police gras ++
                normal  # valeur par defaut
                lighter # police legere

#--- valeur num
font-weight:    1       # le plus clair
                100     # lighter ?
                400     # normal
                700     # bold  


#-----------------------------
#        FONT-STYLE

font-style:     italic;
                normal; # defaut


#-----------------------------
#        TEXT-TRANSFORM

text-transform:     uppercase;
                    lowercase;

                
#-----------------------------
#       SPACING / LINE-HEIGHT

letter-spacing:   2px;
                  0.5em;

word-spacing:     0.3em;

line-height:      12px;
                  5% ;
                  2em;

text-align:       right;
                  left;
                  center;
                  justify;

#-----------------------------
#     @FONT-FACE

# au lieu d utiliser un link ds le html

#   FORMAT  =>  OTF TTF WOFF WOFF2(le plus progressif ?)

# @font-face -> selecteur
#   font-family -> nom defini pour la police dl
#   src -> chemin du fichier pour plusieurs formats

@font-face {
    font-family: 'MyParagraphFont';
    src: url('fonts/Roboto.woff2') format('woff2'),
    url('fonts/Roboto.woff') format('woff'),
    url('fonts/Roboto.ttf') format('truetype');
}

#-----------------------------
#       POLICE SECURISE

#   meme typos sur tout les navigateurs web
#   https://www.cssfontstack.com/

#   sans-serif
Arial
Arial Black
Arial Narrow
Arial Rounded MT Bold
Avant Garde
Calibri
Candara
Century Gothic
Franklin Gothic Medium
Geneva
Gill Sans
Helvetica
Impact
Lucida Grande
Optima
Segoe UI
Tahoma
Trebuchet MS
Verdana
#   Serif
Big Caslon
Bodoni MT
Book Antiqua
Calisto MT
Cambria
Didot
Garamond
Georgia
Goudy Old Style
Hoefler Text
Lucida Bright
Palatino
Perpetua
Rockwell
Rockwell Extra Bold
Baskerville
Times New Roman
#   Monospaced
Consolas
Courier New
Lucida Console
Lucida Sans Typewriter
Monaco
Andale Mono
#   Fantasy
Copperplate
Papyrus
#   Script
Brush Script MT