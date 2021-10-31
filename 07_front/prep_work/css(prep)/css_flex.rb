#=============================
#           CSS 

#-----------------------------

content     :   width height
padding     :   space between content -> border
border      :   padding -> margin
margin      :   border ext

#------------------------------
#         FLEXBOX

# flexbox => div qui compose les autres

.flex{
    display: flex;
    justify-content: space-around; #repartition des flexboxs
                        #space-between -> entre les elements
    align-items :center;    #aligne sur laxe verticale
}                   
.flex-item{
    flex: 0 0 200px; # 0 0 ni plus ni moins de place que les 200px en 3eme p
}
.flex-item2{
    flex: 1 0 auto; #va combler l espace a cause du 1 et du auto avec les autres items
}
