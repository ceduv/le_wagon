#=============================
#           CSS 

#-----------------------------
#       SELECTEUR

    
#    CLASS/ID 
id      ->    unique      =>      #id
class   ->    reccurent   =>      .class

#---
#    UNIV
#   encadre tt les elements de la page
* {
    border: 1px solid red;
  }


#---
#   D ATTRIBUT  
#   href src class id
[href]{
    color: magenta;
}


#---
#   ATTRIBUT + VAL SPECIFIE
<img src='/images/seasons/cold/winter.jpg'>
<img src='/images/seasons/warm/summer.jpg'>

img[src*='winter'] {
    height: 50px;
}
img[src*='summer'] {
    height: 100px;
}


#---
#   ELEMENTS DESCENDANTS
# dabbord la classe puis decendant
<ul class='main-list'>
  <li> ... </li>
</ul>
#   =>
.main-list li

#---

p {
    color: blue;
}
   
.main p {
    color: red;
}

#---

li h4{
    color: gold;
  }

#---
#   MULTIPLES
h1, .menu {
  font-family: Georgia;
}