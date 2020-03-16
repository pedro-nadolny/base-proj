import Foundation
import RxSwift

public protocol Converter {
  associatedtype Input
  associatedtype Output
  func convert(_ input: Event<Input>) -> Event<Output>
}
