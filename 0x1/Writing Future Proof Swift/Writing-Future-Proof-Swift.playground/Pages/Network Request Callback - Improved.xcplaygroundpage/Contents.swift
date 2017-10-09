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
  case unexpectedResponse(Any)
}

protocol NetworkRequestDelegate {
  associatedtype DataType
  func requestFinished(withResponse response: NetworkResponse<DataType>)
}

enum NetworkResponse<DataType> {
  case success(DataType)
  case error(NetworkRequestError)
}

class DataHandler: NetworkRequestDelegate {

  func requestFinished(withResponse response: NetworkResponse<String>) {

    switch response {
    case .success(let data):
      print("We got data: \(data)")
    case .error(let error):
      switch error {
      case .unexpectedResponse(let reponse):
        print("We didn't expect this reponse: \(reponse)")
      default:
        print("Something when wrong: \(error)")
      }
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
datahandler.requestFinished(withResponse: .success("Hello world"))

/*:
 There was an error loading the data:
 */
datahandler.requestFinished(withResponse: .error(NetworkRequestError.noInternetConnection))

/*:
 Passing in both an error and data, or nil values for both is not possible anymore
 */
//datahandler.requestFinished(withResponse: nil) // Gives a compiler error

/*:
 We alo made the response typesafe, so we are sure we can only have the data we expect in case of a successfull response
 */
//datahandler.requestFinished(withResponse: .success(1)) // Gives a compiler error
datahandler.requestFinished(withResponse: .error(NetworkRequestError.unexpectedResponse(1)))

//: [Next](@next)
