//
//  File.swift
//  Neobis_IOS_auth
//

import Foundation

class APIService {
    
    let baseURL = "https://neobisauthproject-production.up.railway.app"
    
    func post<T: Codable>(endpoint: String, data: T, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type" )
        
        do {
            // encode the provided data to JSON
            let jsonData = try JSONEncoder().encode(data)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
                completion(.failure(error))
                return
            }
            
            let statusCode = httpResponse.statusCode
            if 200...299 ~= statusCode {
                if let data = data {
                    completion(.success(data))
                } else {
                    let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Empty response data"])
                    completion(.failure(error))
                }
            } else {
                do {
                    if let responseData = data {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                        if let jsonDict = json as? [String: Any],
                           let errorMessage = jsonDict["message"] as? String {
                            let error = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                            completion(.failure(error))
                            return
                        }
                    }
                } catch {
                    let error = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Failed to parse error response"])
                    completion(.failure(error))
                }
            }
        }
//            if 200...299 ~= statusCode {
//                if let data = data {
//                    completion(.success(data))
//                } else {
//                    let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Empty response data"])
//                    completion(.failure(error))
//                }
//            } else {
//                let error = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Request failed with status code: \(statusCode)"])
//                completion(.failure(error))
//            }
//        }
        task.resume()
    }
}
