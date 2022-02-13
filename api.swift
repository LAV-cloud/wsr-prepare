if API.isValidEmail(email: email) {
    API.getToken(email: email, password: password) { result in
        guard let result = result else {
            return
        }
        token = result
        self.state = .menu
    }
} else {
    print("Invalid email")
}

class api {
    func getToken(email: String, password: String, completion: @escaping((Int)?) -> Void) -> Void {
        let url:String = "auth/login?email=\(email)&password=\(password)"
        let headers = HTTPHeaders([
            HTTPHeader(name: "Content-Type", value: "application/json")
        ])
        performRequest(params: [:], url: url, method: .post, headers: headers)
            .responseDecodable(of: Token.self) { response in
                switch response.result {
                case .success:
                    completion(response.value!.token)
                case .failure(let error):
                    print(error)
                    completion(nil)
                }
            }
    }
    
    func getMovies(state: MenuViewState, completion: @escaping(([Movie]?) -> Void)) -> Void {
        let params = ["filter": state]
        let headers = HTTPHeaders([
            HTTPHeader(name: "Content-Type", value: "application/json"),
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        performRequest(
            params: params,
            url: "movies",
            method: .get,
            headers: headers
        ).responseDecodable(of: [Movie].self) { response in
            switch response.result{
            case .success:
                completion(response.value!)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
    
    func performRequest(
        params: Dictionary<String, Any>,
        url: String,
        method: HTTPMethod,
        headers: HTTPHeaders
    ) -> DataRequest {
        return AF.request(
            "\(host)/\(url)",
            method: method,
            parameters: params,
            headers: headers
        )
    }
}
