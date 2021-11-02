#========= JS =============
#        DATASET

<div id="user" data-uid="2471555" data-github-nickname="Papillard">
  Boris Paillard
</div>

# Then you can access in JavaScript the
#  variables stored in data-attributes:

const boris = document.getElementById('user');
console.log(boris.dataset.uid);
# => "2471555"
console.log(boris.dataset.githubNickname);
# Note the auto-camelization of the key!
# => "Papillard"