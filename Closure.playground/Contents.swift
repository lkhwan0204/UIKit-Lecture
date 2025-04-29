import Swift

func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}

var sumResult: Int = sumFunction(a: 1, b: 2)
print(sumResult)  //결과는 3 왜냐면 위에를 호출해서 사용하게 되서

var sum: (Int,Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

sumResult = sum(1,2)
print(sumResult)

sum = sumFunction(a:b:)

sumResult = sum(1,2)
print(sumResult)

let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in
    return a + b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) -> Int in
    return a - b
}

let divid: (Int, Int) -> Int
divid = { (a: Int, b: Int) -> Int in
    return a / b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a,b)
}

var calculated: Int
calculated = calculate(a: 50, b: 10, method: add)
print(calculated)

calculated = calculate(a: 50, b: 10, method: substract)
print(calculated)


calculated = calculate(a: 50, b: 10, method: divid)
print(calculated)
