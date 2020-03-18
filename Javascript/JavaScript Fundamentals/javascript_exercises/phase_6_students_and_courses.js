class Student {
  constructor(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.courses = [];
  }

  name = function() {
    return `${this.firstName} ${this.lastName}`;
  };

  enroll = function(course) {
    if (this.courses.includes(course) || this.hasConflict(course)) {
      return false;
    }
    this.courses.push(course);
    return true;
  };

  courseLoad = function() {
    let courseMap = new Map();
    this.courses.forEach(course => {
      courseMap.set(course.department, course.credits);
    })
    return courseMap;
  };

  hasConflict = function(course) {
    let res = false;
    this.courses.forEach(enrolledCourse => {
      if (enrolledCourse.conflictsWith(course)) {
        res = true;
      }
    })
    return res;
  };
}

class Course {
  constructor(name, department, credits, meetingDays, timeBlock) {
    this.name = name;
    this.department = department;
    this.credits = credits;
    this.students = [];
    this.meetingDays = meetingDays;
    this.timeBlock = timeBlock;
  }

  addStudent = function(student) {
    if (student.enroll(this)) {
      this.students.push(student);
      return true;
    }
    return false;
  };

  conflictsWith = function(course) {
    if (this.timeBlock != course.timeBlock) {
      return false;
    }
    let res = false;
    this.meetingDays.forEach(day => {
      if (course.meetingDays.includes(day)) {
        res = true;
      }
    })
    return res;
  };

}

let erik = new Student("Erik", "Benton");
let greg = new Student("Greg", "Rosche");
let satu = new Student("Satu", "Heiskanen");

let oChem = new Course("Organic Chemistry", "Chemistry", 2, ["mon", "wed"], 1);
let compPhys = new Course("Computational Physics", "Physics", 3, ["mon", "wed"], 2);
let linearAlg = new Course("Linear Algebra", "Math", 4, ["tues", "thurs"], 1);

console.log(erik.enroll(oChem));
console.log(erik.enroll(linearAlg));
console.log(erik.enroll(compPhys));
console.log(erik.enroll(oChem));

console.log(erik.courseLoad());
console.log(compPhys.conflictsWith(linearAlg));