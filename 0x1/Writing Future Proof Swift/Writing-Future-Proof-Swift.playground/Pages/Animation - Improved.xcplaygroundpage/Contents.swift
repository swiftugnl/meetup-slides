//: [Previous](@previous)

import UIKit

/*:
 ----
 # Example
 A view that displays a color. Using the setBackgroundColor(to:animated:) function, you can change the color with or without animation
 */

/*:
 ----
 ### Support functions
 */
func delay(interval: TimeInterval, action: @escaping () -> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: action)
}

extension UIColor {
  public class func random(withAlpha alpha: CGFloat = 1.0) -> UIColor
  {
    return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: alpha)
  }
}

/*:
 ----
 ### Models
 */
class ColorSampleView: UIView {

  /*:
   By introducing a enum instead of a boolean value, adding new animations is easy.
   In this case I added a new case, but since the original requirements didn't require multiple animations, having a enum with two cases is fine!
   Using associated values, we can now also pass in the duration we want in case of an animation. The .none case doesn't have a duration.
   That is better than using an extra 'duration' parameter in the method, because that would allow you to pass an duration for with a .none animation, which is undefinied behaviour
   */
  enum AnimationType {
    case none
    case fade(TimeInterval)
    case curlUp(TimeInterval)
  }

  func setBackgroundColor(to color: UIColor, withAnimation animation: AnimationType) {

    let changes: () -> Void = { [weak self] in
      self?.backgroundColor = color
    }

    switch animation {
    case .none:
      changes()
    case .fade(let duration):
      UIView.animate(withDuration: duration, animations: changes)
    case .curlUp(let duration):
      changes()
      UIView.transition(with: self, duration: duration, options: .transitionCurlUp, animations: nil)
    }
  }

}
/*:
 ----
 ### Usage
 */
let sampleView = ColorSampleView()
sampleView.frame = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)

import PlaygroundSupport
PlaygroundPage.current.liveView = sampleView

for i in 0...100 {
  delay(interval: Double(i) * 2.0) {

    let animation: ColorSampleView.AnimationType

    switch i % 3 {
    case 1:
      animation = .curlUp(1.0)
    case 2:
      animation = .fade(1.0)
    default:
      animation = .none
    }

    sampleView.setBackgroundColor(to: .random(), withAnimation: animation)
  }
}

//: [Next](@next)
