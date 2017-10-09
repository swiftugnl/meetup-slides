//
//
//    ███████╗ ████████╗ ██████╗   █████╗  ███╗   ██╗  ██████╗  ███████╗ ██████╗
//    ██╔════╝ ╚══██╔══╝ ██╔══██╗ ██╔══██╗ ████╗  ██║ ██╔════╝  ██╔════╝ ██╔══██╗
//    ███████╗    ██║    ██████╔╝ ███████║ ██╔██╗ ██║ ██║  ███╗ █████╗   ██████╔╝
//    ╚════██║    ██║    ██╔══██╗ ██╔══██║ ██║╚██╗██║ ██║   ██║ ██╔══╝   ██╔══██╗
//    ███████║    ██║    ██║  ██║ ██║  ██║ ██║ ╚████║ ╚██████╔╝ ███████╗ ██║  ██║
//    ╚══════╝    ╚═╝    ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═══╝  ╚═════╝  ╚══════╝ ╚═╝  ╚═╝
//
//           ███████╗ ████████╗ ██████╗  ██╗ ███╗   ██╗  ██████╗  ███████╗
//           ██╔════╝ ╚══██╔══╝ ██╔══██╗ ██║ ████╗  ██║ ██╔════╝  ██╔════╝
//           ███████╗    ██║    ██████╔╝ ██║ ██╔██╗ ██║ ██║  ███╗ ███████╗
//           ╚════██║    ██║    ██╔══██╗ ██║ ██║╚██╗██║ ██║   ██║ ╚════██║
//           ███████║    ██║    ██║  ██║ ██║ ██║ ╚████║ ╚██████╔╝ ███████║
//           ╚══════╝    ╚═╝    ╚═╝  ╚═╝ ╚═╝ ╚═╝  ╚═══╝  ╚═════╝  ╚══════╝
//
//    By Sidney de Koning, The Capitals, Swift Usergroup Netherlands, 2017
//
//
import Foundation

/*:
 ### Multiline Strings
 
 No more new lines \n or \t to create multiline strings. Just tab or return
 
 
 */
let myString = "If i want to show newlines \nI need to do it like \nthis or even with \ttabs"
print(myString)

let things = "Fish"
let breaks = """
        A string is a series of \(things), such as "Swift", that forms a collection.
            Strings in Swift are Unicode correct and localeinsensitive, and are designed to be efficient.
        The String type bridges with the Objective-C class NSString and offers interoperability
                with C functions that works with strings.
        """
print(breaks)

print()

let json = """
            {
                "_id": "59a467cf01a4f7d438077b8a",
                "index": 0,
                "guid": "8a734c21-80a4-4c04-a6df-072fcf459b8e",
                "isActive": true,
                "balance": "$1,357.68",
                "picture": "http://placehold.it/32x32",
                "age": 35,
                "name": {
                    "first": "Glenna",
                    "last": "Love"
                },
                "company": "ZAGGLES",
                "email": "glenna.love@zaggles.org",
                "phone": "+1 (985) 559-3947",
                "address": "957 Lefferts Avenue, Turpin, Northern Mariana Islands, 9661",
                "favorite_quote": "Be who you are and say what you feel, because those who mind don’t matter and those who matter don't mind.",
                "latitude": "-47.168174",
                "longitude": "-155.527608"
            }
            """
print(json)

let xml = """
            <!DOCTYPE glossary PUBLIC "-//OASIS//DTD DocBook V3.1//EN">
            <menu>
                <header>Adobe SVG Viewer</header>
                    <item action="Open" id="Open">Open</item>
                    <item action="OpenNew" id="OpenNew">Open New</item>
                <separator/>
                    <item action="ZoomIn" id="ZoomIn">Zoom In</item>
                    <item action="ZoomOut" id="ZoomOut">Zoom Out</item>
                    <item action="OriginalView" id="OriginalView">Original View</item>
                <separator/>
                    <item action="Quality" id="Quality">Quality</item>
                    <item action="Pause" id="Pause">Pause</item>
                    <item action="Mute" id="Mute">Mute</item>
                <separator/>
                    <item action="Find" id="Find">Find...</item>
                    <item action="FindAgain" id="FindAgain">Find Again</item>
                    <item action="Copy" id="Copy">Copy</item>
                    <item action="CopyAgain" id="CopyAgain">Copy Again</item>
                    <item action="CopySVG" id="CopySVG">Copy SVG</item>
                    <item action="ViewSVG" id="ViewSVG">View SVG</item>
                    <item action="ViewSource" id="ViewSource">View Source</item>
                    <item action="SaveAs" id="SaveAs">Save As</item>
                <separator/>
                    <item action="Help" id="Help">Help</item>
                    <item action="About" id="About">About Adobe CVG Viewer...</item>
            </menu>
            """
print(xml)

/*:
### Strings are `Collection`'s again!

The biggest change is that `String` is a `Collection` again, or actually a `BidirectionalCollection` (as it used to be in Swift 1.x), the functionality of `String.CharacterView` has been refactored into  `String`. But `UnicodeScalarView`, `UTF8View`, and `UTF16View` are still there to use.
 */
for char in breaks.prefix(8) {
    // Prints 'A string' per char
    print(char)
}

// No more characters.count!
breaks.count

// Different view can still be accessed
breaks.utf8
breaks.utf16
breaks.unicodeScalars
/*:
 Since `String` is `Collection` again, you can you can use most of the methods on Array, Set and Dictionary
 
 */
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

var random: String = "afnopcdghiqrbjklmest"

var last = random.last
print(last)

var first = random.first
print(first)

var dropFirst = random.dropFirst(3)
print(dropFirst)

var filtered = cafe.filter { $0 != "a" }
print(filtered)
/*:
 ### `Substring` is the new type for String slices
 
 String slices are now instances of type `Substring`. Both `String` and `Substring` conform to `StringProtocol`. Almost the entire string API will live in `StringProtocol` so that `String` and `Substring` behave largely the same.
 */

// Get first 4 chars as a Substring (String.SubSeqence)
let prefix = breaks.prefix(8)

// Get first 4 chars as a Substring (String.SubSeqence)
let suffix = breaks.suffix(8)

// Split a String into Substring
let str = "A whole bunch of awesomeness"
// Get first 8 chars
let offset = str.index(str.startIndex, offsetBy: 8)
var sub = str[str.startIndex...offset]

// From beginning to end of string
sub = str[str.startIndex...]

// From offset to end of string
sub = str[offset...]

// Get out the word bunch
let bunch = str.index(offset, offsetBy: 5)
sub = str[offset...bunch]

/*:
 A `Substring` keeps the full `String` value it was created from in memory. This can lead to high memory usage.
 
 Things to remember;
 - Convert `Substring` back to `String`, using the `String()` initializer.
 - Genreally only pass Strings as params to functions/methods
 */
// Create a String from Substring. This will copy the substring into a new buffer.
let newStr = String(sub)

// Concatenate a String into Substring
sub += "lunch"

let lunch = String(sub)

/*:
 ### Unicode 9
 
 Swift 4 supports Unicode 9, fixing some problems with proper grapheme clustering for modern emoji. All the character counts below are now correct (they weren’t in Swift 3):

 */
// Unicode correct
let cafe1 = "Cafe\u{301}"
let cafe2 = "Café"
print(cafe1 == cafe2)
// Prints "true"

let cafe = "Cafe\u{301} du 🌍"
// Prints "Café du 🌍"
print(cafe)
print(cafe.sorted())

// Prints "9"
print(cafe.count)

// Prints "["C", "a", "f", "é", " ", "d", "u", " ", "🌍"]"
print(Array(cafe))


/*:
 ### `Character.unicodeScalars` property
 
 You can now access the code points of a `Character` directly without having to convert it to a `String` first ([SE-0178][SE-0178]):
 
 [SE-0178]: https://github.com/apple/swift-evolution/blob/master/proposals/0178-character-unicode-view.md "Swift Evolution Proposal SE-0178: Add `unicodeScalars` property to `Character`"
 */


let flag = "🏁"
print(Array(flag.unicodeScalars))
print(flag.count)
// Prints "1"
print(flag.unicodeScalars.count)
// Prints "2"
print(flag.utf16.count)
// Prints "4"
print(flag.utf8.count)
// Prints "8"
