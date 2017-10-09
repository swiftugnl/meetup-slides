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

var color: UIColor {
  switch state {
  case .toDo:
    return .green
  case .inProgress:
    return .blue
  default:
    return .gray
  }
}

let indicatorView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 300))
indicatorView.backgroundColor = color
PlaygroundPage.current.liveView = indicatorView
/*:
 ----
 ## Problem
 * Assumes that all other cases are not development task related. This is true at this moment, but might not be true in the future
 */

//: [Next](@next)
