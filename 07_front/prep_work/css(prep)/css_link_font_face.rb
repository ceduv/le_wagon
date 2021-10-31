#=============================
#           CSS 

#-----------------------------
#         LINK FILE


# HTML HEAD
<link href="style.css" rel="stylesheet">

<link href='https...style.css' rel='stylesheet'>


#-----------------------------
#          URL 

url
body{background-image:url("../images/...")}


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
