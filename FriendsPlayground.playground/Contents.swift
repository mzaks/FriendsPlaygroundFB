//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"


let (f1, f2, f3, f4) = (Friend(), Friend(), Friend(), Friend())

f1.name = "Maxim"
f2.name = "Leo"
f3.name = "Boris"
f4.name = "Marc"

let f5 = Friend()
f5.name = "Daria"

f1.friends = [f1, f2, f3, f4]
f2.friends = [f1, f4]
f3.friends = [f2, f4]

f1.lover = Female(ref: f5)
f5.lover = Male(ref: f1)

f1.father = Friend()
f1.father?.name = "Issai"

f1.mother = Friend()
f1.mother?.name = "Margo"

let data = f1.toByteArray()

let f = Friend.fromByteArray(UnsafePointer<UInt8>(data))

print(f.friends[2]?.friends[0]?.friends[0]?.name)

print(((f.lover as? Female)?.ref?.lover as? Male)?.ref?.name)


let lazyF = Friend.LazyAccess(data: data)

let girlFriend = (lazyF.lover as! Female.LazyAccess).ref
let boyFriend = (girlFriend?.lover as! Male.LazyAccess).ref

lazyF == boyFriend
