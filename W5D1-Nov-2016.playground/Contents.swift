import UIKit

var str = "Hello, playground"


/*:
## Swift 3
 
 - In 2014 Apple blew away developers with a surprise announcement that a new programming language called Swift had been secretly under development for 4 years!
 
 - Since being announced Swift has been officially open sourced and has been ported to Linux. This is huge because it makes its use on servers possible. Google has been talking about using it to replace Java on Android!
 
 - Swift is still rapidly changing. New versions of Swift are not expected to be source compatible until at least Swift 4. So, this limits its use in serious applications.
 */

/*:
## Playgrounds
 
 - Playgrounds is a simple 'Live Coding' environment. 👍🏻👍🏻👍🏻👍🏻
 
 - But Playgrounds are crash prone. 👎🏻👎🏻👎🏻 (💪🏻 set the run option to manual).
*/


//: 👷🏼 Create a sample playground:

/*:
### Markup in Playgrounds

- You can view markdown (Apple calls it "markup") in Playgrounds using a special syntax. You can find the syntax [here](https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/).

- Toggle between rendering and raw markup using the menu item: `editor > show raw markup` or `editor > show rendered markup`
*/
//: ![Imgur](render-markup.png)

/*:
## Variables & Constants

- Declare variables with the  `var` keyword.

- Constants are declared with `let`.
*/

//: **Do**: var & let example (include emoji)

let birthYear = 1988
let name = "George"
let 🐱 = "cat"
let cat:Character = "🐱"


/*:
## Types & Type Inference
- Unlike Objc, Swift declares types after the name, followed by a colon
*/

var address: String = "289 Anywhere St"

/*:
- Swift supports type inference
*/

var address2 = "34 Jones Cr"

var address3: String

/*:
#### Types

- Types are **CAPPED** like Objc.
- Swift has Swift specific foundation types for Int, Double, String, Array, Dictionary.
- You have to cast between them using **as**
*/

var address4 = address2 as NSString

//: **Tip:** prefer Swift types

//: Number literals default to Swift Int type, which is an object!

var n1 = 1
let n2 = -2

//: Float literals default to Double, which is an object!

var f1 = 1.0
let f2 = 2.0

//: **Tip:** prefer Int and Double to other numeric types

let f4: Float = 4.0
var u1: UInt = 20
var n32: Int32 = 32 // You can specify Int sizes

/*:
### `print()` & String Interpolation
- No more `NSLog` 👍🏻
- Use `print()` instead
 */
let s2 = "Mud"
print(#line, f1)
print("my name is \(s2)")
print("my favourite number is \(f4 + Float(f1))")

/*:
## Operators
- "+ - * / =" work similar to Objc
- But you can use them on Strings as well
 */

var s5 = "new "
let r1 = s5 + "world order" // Objc string concat 👎🏻
var s3 = "His name is " + "Bobby"
s3 += " Fisher"
s3

/*:
## Bool
- Unlike Objc we don't use `YES` and `NO`
- use `true` and `false`
*/

let name2 = "Freddy Mercury"
let result1 = name2.hasPrefix("Freddy")
let result2 = name2.hasSuffix("Freddy")

if result1 {
  print("he's the singer of Queen")
}
if result2 {
  print("this never executes")
}

/*: 
## String
- The String class is very complex in Swift.
*/

let char:Character = "T"
let s6 = String(char)

let name3 = "donald drumpf"
let name3Cap = name3.capitalized(with: Locale.current)
if name3 > name3Cap {
  print("You can compare strings")
}

var name4 = name3
name4.removeAll()
let result3 = name4.isEmpty == true ? "Empty" : "No Empty"

/*:
## Optional
- All variables/constants in Swift must have a value unlike Objc
*/

/*
Objc allows variables to be nil

NSString *s7;
if (s7) {
  NSLog(@"%@", s7)
}
*/

/*:
- **In Swift we must explicitly mark a variable/constant as an Optional type which allows it to be either nil or some value**
*/

var notAllowed: String

// error
//if notAllowed == nil {
//  print("not allowed")
//}

var opt1: String?
opt1

if opt1 == nil {
  print(#line, "\(opt1) we have marked opt1 as able to be nil")
}

opt1 = "my first optional string"

/*:
## Why Optionals Need to be Unwrapped
- Think of Optionals as a box, just like NSNumber in Objc
- Just like you cannot do very much with an NSNumber in Objc unless you call `intValue` on it to get the underlying value. So too Optionals are pretty useless unless you **unwrap** them
 
*/
  
/*:
### Forced Unwrap
- The simpless and most dangerous way to unwrap (unbox) an optional is called `forced unwrap`
- Generally avoid this unless you are sure of what you're doing
- Uses the bang operator `!`
*/

var n3: Int?
n3 = 20

//n3 + 10 //error n3 is not an Int

let r4 = n3! + 20

/*:
- Optionals allow you to set any value to nil, including C Struct types, and Int values (but Ints are object types in Swift anyway so that's not that crazy).
*/

var n5:Int? = nil

var rect: CGRect? = nil

// CGRect rect = nil; // error in Objc because CGRect is a primitive type

/*:
- You can force unwrap after checking for nil first. But never do this
*/

// Notice let allows nil and an initial assignment
let n6:String?
n6 = "YES"

//n6 = "NO" //error you can't reassign

/*: 
### Optional Binding
- Swift provides convenience syntax for binding an optional to a variable
*/

if let n6 = n6 {
  print(#line, n6) // prints YES
}

//: **Tip:** The constant we bind it to can be named anything, but always prefer to re-use the initial name

if let someConstant = n6 {
  print(#line, someConstant) // prints YES
}

/*:
## Casting
*/

/*:
## Optional Casting
*/

/*:
## Arrays
- Similar to `NSArray`, and you can still use `NSArray` (but prefer `Array`)
- `NSArray` is heterogeneous
- `Array` is homogeneous
*/


let a1 = [2, 4, 6, 8] // [Int] type inferred

//error let a2 = [2, 4, 6, 8, "John"]

//: Create Mutable Empty Array 2 Ways

var a3: [String] = []
var a4 = [String]()

a3.append("One")
let a5 = ["Two", "Three"]
a3.append(contentsOf: a5)
a3

a3[0]

/*:
## Range
- Used to access a range of values, similar to NSRange
*/

//: Close Range
let range1 = 1...3
a1[range1]

a3[0...1]

//: Half-Open Range
let range2 = 0..<2
a3[range2]

var n7 = [Int](1...10)
n7.removeSubrange(0...5)

n7
n7[0] = 100
n7

n7.remove(at: n7.count-1)
n7

// looping through an array
for i in n7 {
  print(#line, i)
}

// getting the index in a for loop

for (index, value) in n7.enumerated() {
  print(#line, "index: \(index), value: \(value)")
}

//: No C style loops as of Swift 3!

/*
for (i = 0; i < 10; ++i) {
  
}
*/

/*:
## Dictionary
- Similar to `NSDictionary`
- `NSDictionary` is heterogeneous
- `Dictionary` is homogeneous
*/

//: Immutable

let finalGradeDict1:[String: Int]
finalGradeDict1 = ["John": 88, "Erik": 60, "Lori": 70]

let grade1 = finalGradeDict1["John"]

//: Mutable

var answersDict: [Int: Int] = [2: 2*2, 3: 3*3, 4: 4*4]
let answer1 = answersDict[2]
let answer2 = answersDict[5]

if let answer2 = answer2 {
  print("answer2 is nil")
}

// mutating
answersDict[2] = 33

answersDict

// deleting a value

answersDict[2] = nil
answersDict























