import UIKit
//Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//*Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


struct Queue<T: Comparable> {
    var elements: [T] = []
    mutating func add(_ element: T) {
        print("Добавлено значение в очередь: \(element)")
        elements.append(element)
    }
    mutating func add(_ element: [T]) {
        print("Добавлено несколько значений в очередь: \(element)")
        self.elements.append(contentsOf: element)
    }
    mutating func remove() -> T? {
        print("Удалено первое значение очереди: \(elements[0])")
        return elements.removeFirst()
    }
    mutating func filter(predicate: (T) -> Bool ) -> [T] {
        var tmpArray = [T]()
        for element in elements {
            if predicate(element) {
                tmpArray.append(element)
            }
        }
        elements = tmpArray
        print("Очередь отфильтрована:")
        return elements
    }
    mutating func sort(predicate: () -> Bool ) -> [T] {
        elements.sort()
        print("Очередь отсортирована по возрастанию:")
        return elements
    }
    
    subscript(index: Int) -> T?{
        if index > elements.count || index < 0{
            return nil
        }else{
            return elements[index]
        }
    }
}

let chetChislaClosure = { element in
    element % 2 == 0 }
let sortClosure = { () -> Bool in
    return true }

var queue1 = Queue<Int>()
queue1.add(78)
queue1.add([1,2,3,4,5,6,7,8,9,10])
queue1.add([10,9,8,7,6,5,4,3,2,1])
queue1.add(888)
queue1.add(12)
print(queue1)
queue1.remove()
print(queue1)

queue1.filter(predicate: chetChislaClosure)
print(queue1)
queue1.sort(predicate: sortClosure)
print(queue1)
queue1[0]
queue1[100]
queue1[-8]
