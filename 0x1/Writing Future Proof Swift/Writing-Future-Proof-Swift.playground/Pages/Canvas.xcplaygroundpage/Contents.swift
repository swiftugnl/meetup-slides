//: [Previous](@previous)
import UIKit
import PlaygroundSupport
/*:
----
# Exaple
 * A canvas containing Rectangles and Ellipses with different fill colors
 * The entire canvas can be rendered to an image
*/

/*:
 ----
 ## Models
 */

class Canvas {
  var shapes: [Shape]

  init(shapes: [Shape] = [Shape]()) {
    self.shapes = shapes
  }

  func draw(in context: CGContext) {
    for shape in shapes {
      context.setFillColor(shape.fill.cgColor)
      switch shape.type {
      case .ellipse:
        context.addEllipse(in: shape.frame)
      case .rectangle:
        context.addRect(shape.frame)
      }
      context.fillPath()
    }
  }

  func renderToImage(withSize size: CGSize) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    guard let context = UIGraphicsGetCurrentContext() else { return nil }

    draw(in: context)

    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }

}

class Shape {

  enum ShapeType {
    case ellipse, rectangle
  }

  let fill: UIColor
  let frame: CGRect
  let type: ShapeType

  init(type: ShapeType, frame: CGRect, fill: UIColor = .clear) {
    self.type = type
    self.fill = fill
    self.frame = frame
  }
}
/*:
 ----
 ## Usage
 */
let ellipse = Shape(type: .ellipse, frame: CGRect(x: 100.0, y: 100.0, width: 100, height: 100), fill: .yellow)
let rectangle = Shape(type: .rectangle, frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 300), fill: .purple)
let canvas = Canvas(shapes: [rectangle, ellipse])

let image = canvas.renderToImage(withSize: CGSize(width: 300, height: 300))
let imageView = UIImageView(image: image)

PlaygroundPage.current.liveView = imageView
/*:
 ----
 ## Usage
 Problems:
 * The canvas needs to know the details of a shape in order to draw them (for example: support bezier paths)
 * Needs a rewrite when you want to support non-shapes (for example: gradients, masks, groups)
 */

//: [Next](@next)
