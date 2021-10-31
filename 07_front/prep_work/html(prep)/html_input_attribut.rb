#===============================
#           HTML

#-------------------------------
#           INPUT

#type
text password number date checkbox submint
range => curseur (min max step)
radio => impossible de cocher plusieurs
#speciaux input + <balise>  *1
datalist
#speciaux hors input *2
textearea
select => liste radio (select>option*3)

#souvent accompagné d un label => etiquette
label for="AAA">blablabla</label>
<input type="number" name="AAA" id="AAA">

#----
#           DATALIST *1

input type=text list=city id=city name=city
<datalist id=city> option*3 </datalist>

#-----
#           TEXTAREA *2

<textarea id ="extra" name="extra" rows=3 cols=40>
            </textarea>

#-------------------------------
#           ATTRIBUT

id - class - type - name - src - min - max - value
placeholder - for(label) - target - href - required
minlenghth - maxlength - pattern
...
#---
ex : 
pattern ="[a-zA-Z0-9]+"     #   =>  regex not special chars