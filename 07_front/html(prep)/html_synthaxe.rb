#===============================
#           HTML

#-------------------------------

#   div>ul>li*2 

<div>
    <ul>
        <li></li>
        <li></li>
    </ul>
</div>

#-----------------------------
#   ol>li*2 

<ol> 
    <li>des listes de truc</li>
    <li>des listes de truc</li>
</ol>

#-----------------------------
#   div+p+bq 

<div></div>
<b></b>
<blockquote></blockquote>

#-----------------------------
#   div>(header>ul>li*2>a)+footer>p 
#   grouping() 

<div>
    <header>
        <il>
            <li><a href=""></a></li>
            <li><a href=""></a></li>
        </il>
    </header>
    <footer>
        <p></p>
    </footer>
</div>


#-----------------------------
#   div#header+div.page+div#footer.class1.class2.class3 
#   attribute opererators 
#       #                     ->      id                      
#      .page                  ->      class = page            
#      .class.class1.class2   ->      attrib plusieur class   

<div id="header"></div>
<div class="page"></div>
<div id="footer" class="class1 class2 class3"></div>


#-----------------------------
#   ul>li.item$*3 
#   item numbering  " $ " 
<ul>
    <li class="item1"></li>
    <li class="item2"></li>
    <li class="item3"></li>
</ul>
#    ul>li.item$@4*3 
#   change le nombre de depart 
<ul>
    <li class="item4"></li>
    <li class="item5"></li>
    <li class="item6"></li>
</ul>
#   ul>li.item$$$$$$*2 "$$$$$$" 
<ul>
    <li class="item00001"></li>
    <li class="item00002"></li>
    <li class="item00003"></li>
</ul>
#   ul>li.item$@-*5 
#   "-" ordre inverse 


#-----------------------------
#   p>{Click }+a{here}+{ to continue} 
#   Text 
<p>Click <a href="">here</a> to continue</p>



