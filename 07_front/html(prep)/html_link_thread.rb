#===============================
#           HTML

#-------------------------------
#           LINK

#   image link
<a href="https:..." target="_blank">
<img src="https...jpg" alt="Messages..."/>
</a>
#   linking same page
<p id="AAAAA">This is the top of the page!</p>
<h1 id="BBBBB">This is the bottom! </h1>
#
<ol><li><a href="#AAAAA">Top</a></li>
<li><a href="#BBBBB">Bottom</a></li></ol>  
  
#-------------------------------
#           Thread

# th -> titre (clarifie)
# tr -> add row table
# colspan -> passe sur 2 colones
# row span -> 2 lignes

<table>
    <thead> #titre
        <tr>
            <th scope="col">titre 1</th> # scope="col"
            <th>litre 2</th>        # indique titre 1 ref a col
            <th>litre 3</th>
        </tr>
    </thead>
    <tbody> #donées
        <tr>
            <th scope="row">sous titre 1</th> #scope=soustitre1->ligne
            <td>info1</td>
            <td>info2</td>
        </tr>
        <tr>
            <th>sous titre 2</th>
            <td colspan ="2">info1</td> # passe sur 2 colones
            <td rowspan ="2">info2</td> # 2 lignes
        </tr>
    </tbody>
    <tfoot>
        <td>Total</td>
        <td>28</td>
    </tfoot>
</table>