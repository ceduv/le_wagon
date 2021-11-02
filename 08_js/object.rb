#================= JS ====================
#                OBJECT

const instruments = { "john": "guitar", "paul": "bass", "ringo": "drums", "george": "guitar" };

Object.keys(instruments).forEach((beatle) => {
  console.log(beatle + " played the " + instruments[beatle]);
});

#---
# FYI, there is another way, using Object.entries() and a for of construct:

for (const [key, value] of Object.entries(instruments)) {
  console.log(`${key} played the ${value}`);
}