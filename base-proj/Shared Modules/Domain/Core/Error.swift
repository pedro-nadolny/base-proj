import Foundation

public struct Error: LocalizedError {
    public let message: String?
    public let status: Int

    public init(message: String?, status: Int) {
        self.message = message
        self.status = status
    }
}
