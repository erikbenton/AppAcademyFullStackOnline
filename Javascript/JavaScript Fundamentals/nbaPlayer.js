class NBAPlayer {
  constructor(name, team, position) {
    this.name = name
    this.team = team
    this.position = position
  }
  dunk() {
    console.log(this.name + " has just dunked")
  }
  say_my_name() {
    console.log(this.name)
  }
}


let mike = new NBAPlayer("Mike", "Bulls", "center")
let curry = new NBAPlayer("Steph Curry", "GS Warriors", "Point Guard");

mike.dunk()
curry.say_my_name()