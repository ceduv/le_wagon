#=================== JS ======================
#               IMPORT EXPORT

export {fetchMovies};
import {fetchMovies} from ./movies''

#----------------------------------------

const capitalize = (word) => {
  return word[0].toUpperCase() + word.substr(1).toLowerCase();
}

export default capitalize;

#---

# ./src/bar.js
import capitalize from "./foo";

console.log(capitalize("boris"));