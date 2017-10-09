//: [Previous](@previous)

import UIKit
import PlaygroundSupport
/*:
 ----
 # Example
 * A view that shows the state of a development task using a color
 * If the task doesn't need attention from a developer it displays a grey color
 * If the task does need attention from a developer it displays a differen color per state
 */
enum TaskState {
  case backlog
  case toDo
  case inProgress
  case testing
  case done
}

let state: TaskState = .inProgress

/*:
 By specifying these cases explicitly, the compiler can help us out when a new case, for exaple "inReview" is added
 */
var color: UIColor {
  switch state {
  case .toDo:
    return .green
  case .inProgress:
    return .blue
  case .backlog, .testing, .done:
    return .gray
  }
}

let indicatorView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 300))
indicatorView.backgroundColor = color
PlaygroundPage.current.liveView = indicatorView


//: [Next](@next)
