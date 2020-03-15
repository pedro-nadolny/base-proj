import Foundation
import Domain
import RxSwift

final class ListConverter: Converter {

    func convert(_ input: Event<ListDTO>) -> Event<List> {
        return input.map {
            List(list: $0.list ?? [])
        }
    }
}
