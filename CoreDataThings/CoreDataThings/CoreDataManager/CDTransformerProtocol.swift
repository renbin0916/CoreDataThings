//
//  CDTransformerProtocol.swift
//  CoreDataThings
//
//  Created by 任斌 on 2021/7/23.
//

import Foundation

public protocol CDTransformerProtocol: NSObject
{
    
}

extension CDTransformerProtocol
{
    public func y_className() -> String
    {
        return String(describing: Self.self) 
    }
    
}
