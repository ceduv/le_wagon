#===============================
#           HTML

#-------------------------------
#        SEMANTIQUE

<nav>       =>  table des matieres
                #   souvent une liste de lien ul>(li>a)*2

#---  aritcle section aside figure              

<section>   =>  elmt d un doc
                #   chap / zone / mm theme

<article>   =>  du sens en soi
                # articles / blog / commentaires

<aside>     =>  marquer des infos supp
                # utilisé avec articles et sections

<figure>    =>  image en lien avec l article
                # <figure><img src=""></figure>

<figcaption>    =>  legende de figure   
                #   figure>figcation

#---  audio / video

<audio>     =>  <audio><source src="" type=""></audio>
                #   type    => audio/mp3
                #   contols => commande

<video src="coding.mp4" controls>Video not supported</video>

<embed>     =>  img vid aud gif
                # deprecié


#-------------------------------
#    STRUCTURE DE BASE
<html>
  <body>

    <header>
      <h1>title</h1>
        <nav></nav>
    </header>

    <main>
      <p></p>
    </main>  

    <footer>
    </footer>  

  </body>
</html>

