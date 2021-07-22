//
//  CDSaveDataProtocol.swift
//  CoreDataThings
//
//  Created by 任斌 on 2021/7/20.
//

import Foundation

public protocol CDSaveDataProtocol: NSObject
{
    
}

extension CDSaveDataProtocol
{
    public func y_setValueWithDictionary(data: [String : Any])
    {
        var count: UInt32 = 0
        let propertyList = class_copyPropertyList(self.classForCoder, &count)
        for item in 0..<count
        {
            let ut = propertyList![Int(item)]
            let name = property_getName(ut)
            let nameType = property_getAttributes(ut)
            if let pName = RunTimeTool.getPropertyName(parameter: name),
               let pTypeString = RunTimeTool.getPropertyType(parameter: nameType),
               let value = data[pName]
            {
                switch pTypeString
                {
                case "NSDate":
                    if let uv = value as? NSDate
                    {
                        setValue(uv, forKey: pName)
                    }
                case "NSData":
                    if let uv = value as? NSData
                    {
                        setValue(uv, forKey: pName)
                    }
                case "Int64":
                    if let uv = value as? Int64
                    {
                        setValue(uv, forKey: pName)
                    }
                case "Double":
                    if let uv = value as? Double
                    {
                        setValue(uv, forKey: pName)
                    }
                case "Int16":
                    if let uv = value as? Int16
                    {
                        setValue(uv, forKey: pName)
                    }
                case "Bool":
                    if let uv = value as? Bool
                    {
                        setValue(uv, forKey: pName)
                    }
                case "NSString":
                    if let uv = value as? NSString
                    {
                        setValue(uv, forKey: pName)
                    }
                case "Float":
                    if let uv = value as? Float
                    {
                        setValue(uv, forKey: pName)
                    }
                case "NSDecimalNumber":
                    if let uv = value as? NSDecimalNumber
                    {
                        setValue(uv, forKey: pName)
                    }
                case "Int32":
                    if let uv = value as? Int32
                    {
                        setValue(uv, forKey: pName)
                    }
                default:
                    debugPrint("未能解析")
                }
                
            }
            
        }
    }
}

