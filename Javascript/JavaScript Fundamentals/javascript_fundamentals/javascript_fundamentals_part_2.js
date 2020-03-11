const titleize = (names, func) => {
  // First titleize the names
  let titles = names.map(name => {
    // Split the names up in case given First and Last
    let words = name.split(" ");
    let capitals = words.map(word => {
      // Capitalize first letter of each name
      return word[0].toUpperCase() + word.slice(1);
    });
    // Join the names back together
    let title = capitals.join(' ');
    return `Mx. ${title} Jingleheimer Schmidt`
  });
  // Invoke the callback
  titles.forEach(el => func(el))
  return;
};

console.log(titleize(["mary butler", "Brian", "Leo"], console.log));

class Elephant {
  constructor(name, height_inches, tricks) {
    this.name = name;
    this.height = height_inches;
    this.tricks = tricks;
  }

  trumpet = () => {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`)
  };

  grow = () => { this.height += 12 };

  addTrick = (trick) => { this.tricks.push(trick) };

  play = () => {
    let random_ind = Math.floor(Math.random() * this.tricks.length);
    let trick = this.tricks[random_ind];
    console.log(`${this.name} is ${trick}`);
  };

  static paradeHelper = (elephant) => {
    console.log(`${elephant.name} is trotting by!`);
  };
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper(micah);
herd.forEach(ele => Elephant.paradeHelper(ele));

const dinerBreakfast = () => {
  let order = "cheesy scrambled eggs";
  console.log(`I'd like ${order} please`);

  return (more_food) => {
    order += ` and ${more_food}`;
    console.log(`I'd like ${order} please`);
  };
};

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
bfastOrder("omelete");