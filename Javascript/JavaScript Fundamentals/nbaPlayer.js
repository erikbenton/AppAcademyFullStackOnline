function NBAPlayer(name, team, position)
{
  this.name = name
  this.team = team
  this.position = position

  this.dunk = function()
  {
    console.log(this.name + " has just dunked")
  }
}

let mike = new NBAPlayer("Mike", "Bulls", "center")

mike.dunk()