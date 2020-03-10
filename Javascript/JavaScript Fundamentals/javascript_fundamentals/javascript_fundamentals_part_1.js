const madlib = function(verb, adjective, noun) {
  verb = verb.toUpperCase();
  adjective = adjective.toUpperCase();
  noun = noun.toUpperCase();
  console.log(`We shall ${verb} the ${adjective} ${noun}`);
  return;
};

madlib('make', 'best', 'guac');

const isSubstring = function(searchString, subString) {
  let words = searchString.split(" ");
  return words.some(word => word === subString);
};

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));