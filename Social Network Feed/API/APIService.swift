import Foundation

protocol APIServiceProtocol {
    func extractPosts(completion: @escaping (Result<[PostDTO], Error>) -> Void)
    func extractUsers(completion: @escaping (Result<[UserDTO], Error>) -> Void)
}

final class APIService: APIServiceProtocol {
    
    func extractPosts(completion: @escaping (Result<[PostDTO], any Error>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else {
            completion(.failure(NSError(domain: "Ошибка", code: 1001)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "Ошибка", code: 1001)))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "Ошибка", code: 1001)))
                }
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([PostDTO].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(posts))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
        
    }
    
    func extractUsers(completion: @escaping (Result<[UserDTO], any Error>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return completion(.failure(NSError(domain: "Ошибка в ссылке", code: 1001)))
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(error ?? NSError(domain: "Неизвестная ошибка", code: 1002)))
                }
                return
            }
            
            do {
                let users = try JSONDecoder().decode([UserDTO].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(users))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    
    }
    
    
}


