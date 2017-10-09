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

  func setBackgroundColor(to color: UIColor, animated: Bool) {

    let duration = animated ? 1.0 : 0.0

    UIView.animate(withDuration: duration) { 
      self.backgroundColor = color
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
    sampleView.setBackgroundColor(to: .random(), animated: (i % 2 != 0))
  }
}
/*:
 ----
 # Problems
 This code needs a rewrite when
 * You want to support different types of animations
 * You want to support different animation intervals
 * The animation is specific to the background color. What if you want to animate different properties as well?
*/

//: [Next](@next)
