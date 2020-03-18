class Student {
  constructor(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.courses = [];
  }

  name = function() {
    return `${this.firstName} ${this.lastName}`;
  }
}