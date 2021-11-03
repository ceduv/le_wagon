#=============== JS =================
#               date

# afficher depuis combien de temps a ete poster le message

data.messages.forEach((row) => {
  const minutesAgo = Math.round((new Date() - new Date(row.created_at)) / 60000);
# on fait un date - la date passer par le created_at
# row.created_at = message recupere par une api