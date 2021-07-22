//
//  AbilityTransformer.swift
//  CoreDataThings
//
//  Created by 任斌 on 2021/7/22.
//

import UIKit

public class AbilityTransformer: NSSecureUnarchiveFromDataTransformer
{
    public override class var allowedTopLevelClasses: [AnyClass]
    {
        return [Ability.self]
    }
    
    public static func register()
    {
        let name = NSValueTransformerName("\(AbilityTransformer.self)")
        let transformer = AbilityTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}
