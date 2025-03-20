//
//  Registration.swift
//  HotelCodable
//
//  Created by Jestin Dorius on 3/17/25.
//
import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String

    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int

    var roomType: RoomType
    var wifi: Bool
}

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    //Equatable Protocol Implementation for RoomType
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
    
    static var all: [RoomType] {
        return [
            RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 279),
            RoomType(id: 1, name: "One King", shortName: "1K", price: 209),
            RoomType(id: 2, name: "Penthouse", shortName: "PHS", price: 309)]
    }
}
