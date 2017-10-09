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

/*:
 By introduction a drawable protocol, we can let objects interact without knowing the specifics on how to draw them
 */
protocol Drawable {
  func draw(in context: CGContext)
}

/*:
 The canvas has become more shy, it doesn't now anything about it's contents, it only knows that it can be drawn in the context
 */

class Canvas {
  var contents: [Drawable]

  init(contents: [Drawable] = [Drawable]()) {
    self.contents = contents
  }

  func draw(in context: CGContext) {
    for item in contents {
      item.draw(in: context)
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

  let fill: UIColor
  let frame: CGRect

  init(frame: CGRect, fill: UIColor) {
    self.frame = frame
    self.fill = fill
  }
}

/*:
 The Rectangle is the only one knowing the specifics on how to draw it.
 */

class Rectangle: Shape, Drawable {
  func draw(in context: CGContext) {
    context.setFillColor(fill.cgColor)
    context.addRect(frame)
    context.fillPath()
  }
}

/*:
 The Ellipsis is the only one knowing the specifics on how to draw it.
 */

class Ellipsis: Shape, Drawable {
  func draw(in context: CGContext) {
    context.setFillColor(fill.cgColor)
    context.addEllipse(in: frame)
    context.fillPath()
  }
}

/*:
 Now that we haven't constrained ourselfs to shapes, adding complex drawables like gradients is no problem at all
 */

class Gradient: Drawable {

  struct Stop {
    let location: CGFloat
    let color: UIColor
  }

  enum Direction {
    case horizontal
    case vertical
  }

  let stops: [Stop]
  let direction: Direction
  let frame: CGRect

  init(frame: CGRect, direction: Direction, stops: [Stop]) {
    self.stops = stops
    self.direction = direction
    self.frame = frame
  }

  func draw(in context: CGContext) {

    let colorSpace = CGColorSpaceCreateDeviceRGB()
    var colors = [CGColor]()
    var locations = [CGFloat]()

    for stop in stops {
      colors.append(stop.color.cgColor)
      locations.append(stop.location)
    }

    guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations) else { return }

    let endPoint: CGPoint

    switch direction {
    case .vertical:
      endPoint = CGPoint(x: frame.minX, y: frame.maxY)
    case .horizontal:
      endPoint = CGPoint(x: frame.maxX, y: frame.minY)
    }

    context.drawLinearGradient(gradient,
                               start: frame.origin,
                               end: endPoint,
                               options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
  }
}

/*:
 ----
 ## Usage
 */
let ellipse = Ellipsis(frame: CGRect(x: 100.0, y: 100.0, width: 100, height: 100), fill: .yellow)
let rectangle = Rectangle(frame: CGRect(x: 70.0, y: 0.0, width: 160, height: 300), fill: .purple)

let stops = [
  Gradient.Stop(location: 0.0, color: .purple),
  Gradient.Stop(location: 1.0, color: .yellow)
]

let gradient = Gradient(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 300), direction: .vertical, stops: stops)
let canvas = Canvas(contents: [gradient, rectangle, ellipse])

let image = canvas.renderToImage(withSize: CGSize(width: 300, height: 300))
let imageView = UIImageView(image: image)

PlaygroundPage.current.liveView = imageView

//: [Next](@next)
