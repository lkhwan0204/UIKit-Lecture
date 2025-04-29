import SwiftUI

var someAny: Any = 100
someAny = "어떤 타입도 수용 가능하다"
someAny = 123.12

//let someDouble: Double = someAny

class SomeClass {}
var someAnyObject: AnyObject = SomeClass()
//someAnyObject = 123.12

someAny = nil
someAnyObject = nil
