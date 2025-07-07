//
//  NetworkController.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 6/19/25.
//
import Foundation

struct NetworkController {
    enum NetworkError: Error, LocalizedError {
        case couldNotGetUser
        case couldNotGetPosts
        case couldNotCreatePost
        case invalidURLEntry
        case invalidURLComponents
        case badResponse
    }
    
    // Put all network calls here
    
    // GET CALLS
    
    // GET UserProfile Call
    func getUserProfile(userUUID: UUID, userSecret: UUID) async throws -> UserProfile {
        try? await Task.sleep(for: .seconds(1))
        // Cannot use httpBody for get requests must be components
        guard var components = URLComponents(string: "\(API.url)/userProfile") else {
            throw NetworkError.invalidURLEntry
        }
        // Set components
        components.queryItems = [
            URLQueryItem(name: "userUUID", value: "\(userUUID)"),
            URLQueryItem(name: "userSecret", value: "\(userSecret)")
        ]
        // Define URL
        guard let url = components.url else {
            throw NetworkError.invalidURLComponents
        }
        // Create URLRequest using url
        var request = URLRequest(url: url)
        // Also denote what type of request, get or post
        request.httpMethod = "GET"
        // Set headers if present
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session = URLSession(configuration: config)
        
        
        // Make request
        let (data, response) = try await session.data(for: request)
        // Ensure we have a good response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.couldNotGetUser
        }
        
        // Decode our response data to usable object
        let decoder = JSONDecoder()
        let userProfile = try decoder.decode(UserProfile.self, from: data)
        
        return userProfile
    }
    // Get first 20 Posts "Last requirement"
    func getFirstTwentyPosts(userSecret: UUID) async throws -> [Post] {
        // Define components
        guard var components = URLComponents(string: "\(API.url)/posts") else {
            throw NetworkError.invalidURLComponents
        }
        
        // Set query items
        components.queryItems = [
            URLQueryItem(name: "userSecret", value: "\(userSecret)"),
            URLQueryItem(name: "pageNumber", value: "\(0)")
        ]
        // Define URL
        guard let url = components.url else {
            throw NetworkError.invalidURLEntry
        }
        // Create request
        var request = URLRequest(url: url)
        // Set request method
        request.httpMethod = "GET"
        // Set headers if any are present
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // Create URL Session
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session = URLSession(configuration: config)
        // Make request
        let (data, response) = try await session.data(from: url)
        // Check response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.couldNotGetPosts
        }
        // Convert data into some object
        let posts = try JSONDecoder().decode([Post].self, from: data)
        // Return
        return posts
    }
    
    func getSecondTwentyPosts(userSecret: UUID) async throws -> [Post] {
        // Define components
        guard var components = URLComponents(string: "\(API.url)/posts") else {
            throw NetworkError.invalidURLComponents
        }
        
        // Set query items
        components.queryItems = [
            URLQueryItem(name: "userSecret", value: "\(userSecret)"),
            URLQueryItem(name: "pageNumber", value: "\(2)")
        ]
        // Define URL
        guard let url = components.url else {
            throw NetworkError.invalidURLEntry
        }
        // Create request
        var request = URLRequest(url: url)
        // Set request method
        request.httpMethod = "GET"
        // Set headers if any are present
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // Create URL Session
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session = URLSession(configuration: config)
        // Make request
        let (data, response) = try await session.data(from: url)
        // Check response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.couldNotGetPosts
        }
        // Convert data into some object
        let posts = try JSONDecoder().decode([Post].self, from: data)
        // Return
        return posts
    }
    
    // GET UserPosts
    func getUserPosts(userSecret: UUID, userUUID: UUID, pageNumber: Int? = nil) async throws -> [Post] {
        // Initialize components
        guard var components = URLComponents(string: "\(API.url)/userPosts") else {
            throw NetworkError.invalidURLComponents
        }
        
        // Set Query items
        components.queryItems = [
            URLQueryItem(name: "userSecret", value: userSecret.uuidString),
            URLQueryItem(name: "userUUID", value: userUUID.uuidString),
            URLQueryItem(name: "pageNumber", value: "\(pageNumber ?? 0)")
        ]
        
        // Create URL
        guard let url = components.url else {
            throw NetworkError.invalidURLEntry
        }
        
        // Create request
        var request = URLRequest(url: url)
        
        // Set request method
        request.httpMethod = "GET"
        
        // Set headers if present
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Create session
        let session = URLSession.shared
        
        // Make request
        let (data, response) = try await session.data(for: request)
        
        // Check response and ensure good status code
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        // Convert data into some codable object
        let posts = try JSONDecoder().decode([Post].self, from: data)
        
        return posts
    }
    
    // POST Calls
    
    func createPost(userSecret: UUID, title: String, body: String) async throws -> Post {
        // Initialize our sessions and request
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "\(API.url)/createPost")!)
        
        // Put the credentials in JSON Format
        let credentials: [String: Any] = [
            "userSecret": userSecret.uuidString,
            "post": ["title": title, "body": body]
        ]
        
        // Add json data to the body of request. Also clarify that this is a POST call
        request.httpBody = try JSONSerialization.data(withJSONObject: credentials, options: .prettyPrinted)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // Make request
        let (data, response) = try await session.data(for: request)
        // Ensure that we have a good status code
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
            throw NetworkError.badResponse
        }
        
        let post = try JSONDecoder().decode(Post.self, from: data)
        return post
    }
    
    // POST edit post call
    func editPost(userSecret: UUID, post: Post) async throws {
        // Initialize session and request
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "\(API.url)/editPost")!)
        
        // Make credentials
        let credentials: [String: Any] = [
            "userSecret": userSecret.uuidString,
            "post": [
                "postid": post.postid,
                "title": post.title,
                "body": post.body
            ]
        ]
        
        // Add json data to the body of request. Also clarify that this is a POST call
        request.httpBody = try JSONSerialization.data(withJSONObject: credentials, options: .prettyPrinted)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make request
        let (_, response) = try await session.data(for: request)
        
        // Check response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
    }
    
    func editProfile(secret: UUID, profile: UserProfile) async throws -> UserProfile {
        // Define session and request
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "\(API.url)/userProfile")!)
        // Make credentials
        let credentials: [String: Any] = [
            "userSecret": secret.uuidString,
            "profile": [
                "userName": profile.userName,
                "bio": profile.bio,
                "techInterests": profile.techInterests
            ]
        ]
        // Add json data to the body of request, also clarify that its a POST call
        request.httpBody = try JSONSerialization.data(withJSONObject: credentials, options: .prettyPrinted)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make Request
        let (data, response) = try await session.data(for: request)
        
        // Check response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let updatedProfile = try JSONDecoder().decode(UserProfile.self, from: data)
        return updatedProfile
    }
    func deletePost(userSecret: UUID, postIDs: [Int]) async throws {
        // Define Components
        guard var components = URLComponents(string: "\(API.url)/post") else {
            throw NetworkError.invalidURLComponents
        }
        // Set Query items or body
        for postId in postIDs {
            components.queryItems = [
                URLQueryItem(name: "userSecret", value: userSecret.uuidString),
                URLQueryItem(name: "postid", value: "\(postId)")
            ]
        }
        // Define URL
        guard let url = components.url else {
            throw NetworkError.invalidURLComponents
        }
        // Define request
        var request = URLRequest(url: url)
        // Set Method and value for headers if present
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        // Make request
        let (_, _) = try await session.data(for: request)
    }
}

