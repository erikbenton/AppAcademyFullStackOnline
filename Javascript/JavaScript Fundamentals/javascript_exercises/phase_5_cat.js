class Cat {
  constructor(name, owner) {
    this.name = name;
    this.owner = owner;
  }

  cuteStatement = () => {
    return `${this.owner} loves ${this.name}`;
  };

  meow = () => {
    return `meow`;
  };
}

const anotherStatement = function() {
  return `Everyone loves ${this.name}!`;
};

let satu = new Cat("Satu", "Mum");
let erik = new Cat("Erik", "Mom");

console.log(satu.cuteStatement());
console.log(erik.cuteStatement());

satu.cuteStatement = anotherStatement;

console.log(satu.cuteStatement());
console.log(erik.cuteStatement());