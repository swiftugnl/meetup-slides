//: [Previous](@previous)
import UIKit
import PlaygroundSupport
/*:
 ----
 # Example
 A delegate protocol that returns the result of an api call. The delegate has access to:
 * the error in case of a failure
 * the loaded data in case of success

 */

/*:
 ----
 ### Models
 */
enum NetworkRequestError: Error {
  case noInternetConnection
  case internalServerError
  // ....
}

protocol NetworkRequestDelegate {
  func requestFinished(data: Any?, error: Error?)
}

class DataHandler: NetworkRequestDelegate {

  func requestFinished(data: Any?, error: Error?) {

    if let error = error {
      print("Something when wrong: \(error)")
    }
    else if let data = data {
      print("We got data: \(data)")
    }
  }
}
/*:
 ----
 ### Usage
 */
let datahandler = DataHandler()

/*:
 The network request successfully loads data:
 */
datahandler.requestFinished(data: "Hello world", error: nil)

/*:
 There was an error loading the data:
 */
datahandler.requestFinished(data: nil, error: NetworkRequestError.noInternetConnection)

/*:
 Wait, this should not be possible. Having a successful response and an error 🤔
 */
datahandler.requestFinished(data: "Hello world", error: NetworkRequestError.noInternetConnection)

/*:
 And what do we expect when this happens?? In this case nothing happens, because there is no else case
 */
datahandler.requestFinished(data: nil, error: nil)

/*:
 There is also not define what type of data we expect, we can pass in an integer if expect to return an integer.
 We would rather treat this as an 'unexpected response' error
 */
datahandler.requestFinished(data: 1, error: nil)
/*:
 ----
 # Problems
 * The behaviour leaves room for assumptions when both the data and the error contain values, or both are nil
 * The data has type Any, so it needs to be casted to the expected type. This means that the success state can fail as well. It would be better to have an 'unexpected response' error in this case
 */

//: [Next](@next)
