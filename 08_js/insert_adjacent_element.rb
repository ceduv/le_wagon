#====================== JS ==============================
#           INSERT ADJACENT HTML / TEXT

const list = document.getElementById("players"); # select a </ul>

list.insertAdjacentHTML("beforeend", "<li>Luke</li>");

# You can use beforebegin, afterbegin, beforeend or afterend:

<!-- beforebegin -->
<p>
  <!-- afterbegin -->
  the content
  <!-- beforeend -->
</p>
<!-- afterend -->

#---

insertAdjacentText