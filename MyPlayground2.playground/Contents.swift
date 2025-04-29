import Swift

func greeting(friend: String, me: String = "yagom") {
    print("hello \(friend)! I'm \(me)")
}

greeting(friend: "hana")
greeting(friend: "john", me: "eric")

func greeting(to friend: String, from me: String){
    print("Hello \(friend)! I'm \(me)")
}

greeting(to: "hana", from: "yagom")

func sayHelloToFriends(me: String, friends: String...) -> String {
    return"Hello \(friends)! I'm \(me)"
}
print(sayHelloToFriends(me: "yagom", friends: "hana", "eric", "wing"))
print(sayHelloToFriends(me: "yagom"))

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "yagom")

someFunction = greeting(friend:me:)
someFunction("eric", "yagom")

func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}

runAnother(function: greeting(friend:me:))
runAnother(function: someFunction)

