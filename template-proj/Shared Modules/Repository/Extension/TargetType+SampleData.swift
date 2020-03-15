import Foundation
import Moya

extension TargetType {
    public var sampleData: Data {
        let jsonName = "Mock_" + String(describing: type(of: self.self)) + "_" + String(describing: self)
        let bundle = Bundle(identifier: "template.proj.Repository")

        guard let path = bundle?.path(forResource: jsonName, ofType: "json") else {
            debugPrint("Error loading mock file " + jsonName + ".json")
            return Data()
        }

        let url = URL(fileURLWithPath: path)
        let data: Data

        do {
            data = try Data(contentsOf: url)
        } catch let nsError as NSError {
            debugPrint(nsError.localizedDescription)
            data = Data()
        } catch {
            debugPrint("Error loading mock file " + jsonName + ".json")
            data = Data()
        }

        return data
    }
}
