
import Foundation

class JSONParser {
    
    class func convertToDictionary(_ jsonString: String) -> [String: Any]? {
        
        if let data = jsonString.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return nil
        
    }
    
}
