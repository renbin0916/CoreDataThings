//
//  RunTimeTool.swift
//  CoreDataThings
//
//  Created by 任斌 on 2021/7/20.
//

import Foundation

public class RunTimeTool
{
    public static func getPropertyName(parameter: UnsafePointer<CChar>) -> String?
    {
        return String(utf8String: parameter)
    }
    
    public static func getPropertyType(parameter: UnsafePointer<CChar>?) -> String?
    {
        guard let up = parameter,
              let resultUsedParameter = String(utf8String: up),
              let typeString = resultUsedParameter.components(separatedBy: ",").first
        else { return nil }
        
        let resultTypeString: String?
        if typeString.contains("NSDate")
        {
            resultTypeString = "NSDate"
        }
        else if typeString.contains("NSData")
        {
            resultTypeString = "NSData"
        }
        else if typeString.contains("Tq")
        {
            resultTypeString = "Int64"
        }
        else if typeString.contains("Td")
        {
            resultTypeString = "Double"
        }
        else if typeString.contains("Ts")
        {
            resultTypeString = "Int16"
        }
        else if typeString.contains("TB")
        {
            resultTypeString = "Bool"
        }
        else if typeString.contains("NSString")
        {
            resultTypeString = "NSString"
        }
        else if typeString.contains("Tf")
        {
            resultTypeString = "Float"
        }
        else if typeString.contains("NSDecimalNumber")
        {
            resultTypeString = "NSDecimalNumber"
        }
        else if typeString.contains("Ti")
        {
            resultTypeString = "Int32"
        }
        else
        {
            resultTypeString = nil
        }
        return resultTypeString
    }
}
