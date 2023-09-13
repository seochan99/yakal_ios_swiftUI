
import Foundation
import SwiftUI
import Combine

class GetMedicineAction{
    private var imageCache: [String: Image] = [:]
       
       func fetchDrugInfo(kdCode: String, completion: @escaping (DrugInfoResponse?, Error?) -> Void) {
           guard let url = URL(string: "https://api2.kims.co.kr/api/drug/info?drugcode=\(kdCode)&drugType=N") else {
               completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
               return
           }

           var request = URLRequest(url: url)
           request.httpMethod = "GET"
           
           // Username and Password
           let username = "DIVWPM"
           let password = "DIVWPM"
           let loginString = "\(username):\(password)"
           if let utf8Data = loginString.data(using: .utf8) {
               let base64LoginString = utf8Data.base64EncodedString()
               request.addValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
           }

           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               if let data = data {
                   do {
                       let response = try JSONDecoder().decode(DrugInfoResponse.self, from: data)
                       completion(response, nil)
                   } catch {
                       completion(nil, error)
                   }
               } else {
                   completion(nil, error)
               }
           }

           task.resume()
       }
}
