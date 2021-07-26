//
//  Ability.swift
//  CoreDataThings
//
//  Created by 任斌 on 2021/7/22.
//

import Foundation
import UIKit

public class Ability: NSObject, NSSecureCoding, CDTransformerProtocol
{
    
    public let name: String
    public let destructivePower: Int64
    public let couldRestoreVitality: Bool
    public let color: UIColor
    public let locations: [CGPoint]
    
    init(with name: String,
         destructivePower: Int64,
         couldRestoreVitality: Bool,
         color: UIColor,
         locations: [CGPoint])
    {
        self.name = name
        self.destructivePower = destructivePower
        self.couldRestoreVitality = couldRestoreVitality
        self.color = color
        self.locations = locations
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(name as NSString, forKey: Keys.name.rawValue)
        coder.encode(destructivePower, forKey: Keys.destructivePower.rawValue)
        coder.encode(couldRestoreVitality, forKey: Keys.couldRestoreVitality.rawValue)
        coder.encode(color, forKey: Keys.color.rawValue)
        let locationsString = locations.map { NSCoder.string(for: $0) as NSString } as NSArray
        coder.encode(locationsString, forKey: Keys.locations.rawValue)
    }
    
    public required convenience init?(coder: NSCoder) {
        let tName  = (coder.decodeObject(of: NSString.self, forKey: Keys.name.rawValue) as String?) ?? ""
        let tDestructivePower = coder.decodeInt64(forKey: Keys.destructivePower.rawValue)
        let tCouldRestoreVitality = coder.decodeBool(forKey: Keys.couldRestoreVitality.rawValue)
        let tColor = coder.decodeObject(of: UIColor.self, forKey: Keys.color.rawValue) ?? .clear
        let tLocations = (coder.decodeObject(of: NSArray.self, forKey: Keys.locations.rawValue) as? [String]) ?? []
        let uLocations = tLocations.map { NSCoder.cgPoint(for: $0) }
        
        self.init(with: tName,
                  destructivePower: tDestructivePower,
                  couldRestoreVitality: tCouldRestoreVitality,
                  color: tColor,
                  locations: uLocations)
        
    }
    
    public static var supportsSecureCoding: Bool
    {
        return true
    }
   
    enum Keys: String
    {
        case name = "name"
        case destructivePower = "destructivePower"
        case couldRestoreVitality = "couldRestoreVitality"
        case color = "color"
        case locations = "locations"
    }

    
}
