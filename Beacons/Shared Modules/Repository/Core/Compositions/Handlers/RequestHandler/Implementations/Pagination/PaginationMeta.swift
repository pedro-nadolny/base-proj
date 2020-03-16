import Foundation

struct PaginationMeta: Decodable {
  let numberOfItems: Int

  private enum CodingKeys: String, CodingKey {
    case numberOfItems = "number_of_items"
  }
}
