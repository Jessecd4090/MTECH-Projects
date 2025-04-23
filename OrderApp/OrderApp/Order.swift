//
//  Order.swift
//  OrderApp
//
//  Created by Jestin Dorius on 4/23/25.
//
struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
