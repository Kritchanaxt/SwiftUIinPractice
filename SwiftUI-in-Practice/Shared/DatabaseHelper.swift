//
//  DatabaseHelper.swift
//  SwiftUI-in-Practice
//
//  Created by Kritchanat on 14/7/2567 BE.
//


import Foundation

struct DatabaseHelper {
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // ตรวจสอบสถานะของ HTTP response
        if let httpResponse = response as? HTTPURLResponse {
            print("HTTP Status Code: \(httpResponse.statusCode)")
        }
        
        // พิมพ์ข้อมูล JSON ที่ได้รับ
        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
            print("Product JSON Object: \(jsonObject)")
        }

        
        do {
            let products = try JSONDecoder().decode(ProductArray.self, from: data)
            return products.products
        } catch {
            print("Failed to decode Product JSON: \(error)")
            throw error
        }

    }
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // ตรวจสอบสถานะของ HTTP response
        if let httpResponse = response as? HTTPURLResponse {
            print("HTTP Status Code: \(httpResponse.statusCode)")
        }
        
        // พิมพ์ข้อมูล JSON ที่ได้รับ
        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
            print("Product JSON Object: \(jsonObject)")
        }

        
        do {
            let decoder = JSONDecoder()
            decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
            
            let users = try decoder.decode(UserArray.self, from: data)
            return users.users
        } catch {
            print("Failed to decode User JSON: \(error)")
            throw error
        }
    }

}
