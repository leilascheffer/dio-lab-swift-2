class Student {
    var name: String
    var age: Int
    var subjects: [String]
    var status: Status
    
    enum Status {
        case enrolled
        case graduated
        case droppedOut
    }

    init(name: String, age: Int, subjects: [String], status: Status) {
        self.name = name
        self.age = age
        self.subjects = subjects
        self.status = status
    }
    
    func description() -> String {
        return "\(name), \(age) anos, \(status), matriculado em \(subjects.joined(separator: ", "))"
    }
}

let student1 = Student(name: "Lucas", age: 20, subjects: ["Matemática", "História"], status: .enrolled)
let student2 = Student(name: "Maria", age: 25, subjects: ["Filosofia", "Cálculo"], status: .droppedOut)

let displayInfo: (Student) -> Void = { student in
    if student.age >= 20 && student.status == .enrolled {
        print(student.description())
    }
}

displayInfo(student1)

func calculateAverageAge(students: [Student]) -> Double {
    return Double(students.reduce(0, { $0 + $1.age })) / Double(students.count)
}

calculateAverageAge(students: [student1, student2])

