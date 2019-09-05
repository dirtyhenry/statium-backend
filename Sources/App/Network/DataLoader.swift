import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]?
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.football-data.org"
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}

extension Endpoint {
    static func listCompetitions() -> Endpoint {
        return Endpoint(path: "/v2/competitions/", queryItems: nil)
    }
}

class DataLoader {
    func get(_ endpoint: Endpoint, then handler: @escaping (Data) -> Void) {
        guard let url = endpoint.url else {
            fatalError("Can't build a URL from endpoint")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, _ in
            let httpResponse = response as? HTTPURLResponse
            if httpResponse?.statusCode == 200 {
                guard let data = data else {
                    fatalError("No data in a 200")
                }
                
                handler(data)
            } else {
                print("statusCode: \(httpResponse?.statusCode)")
            }
        }
        
        debugPrint("Requesting \(url)")
        task.resume()
    }

}
