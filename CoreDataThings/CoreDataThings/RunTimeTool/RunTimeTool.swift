//
//  RunTimeTool.swift
//  CoreDataThings
//
//  Created by 任斌 on 2021/7/20.
//

import Foundation

public class RunTimeTool
{
    public static let shared = RunTimeTool()
    
    private init() {}
    
    public var classArray: [AnyClass] = []
    private var _classNameArray: Set<String> = []
    
    public static func register(_ classT: AnyObject.Type)
    {
        RunTimeTool.shared._classNameArray.insert("\(classT.self)")
    }
    
    public func getPropertyName(parameter: UnsafePointer<CChar>) -> String?
    {
        return String(utf8String: parameter)
    }
    
    /// 获取对应数据类型的字符串
    public func getPropertyType(parameter: UnsafePointer<CChar>?) -> String?
    {
        guard let up = parameter,
              let resultUsedParameter = String(utf8String: up),
              let typeString = resultUsedParameter.components(separatedBy: ",").first
        else { return nil }
        
        var resultTypeString: String? = nil
        if typeString == "T@\"NSDate\""
        {
            resultTypeString = "NSDate"
        }
        else if typeString == "T@\"NSData\""
        {
            resultTypeString = "NSData"
        }
        else if typeString == "Tq"
        {
            resultTypeString = "Int64"
        }
        else if typeString == "Td"
        {
            resultTypeString = "Double"
        }
        else if typeString == "Ts"
        {
            resultTypeString = "Int16"
        }
        else if typeString == "TB"
        {
            resultTypeString = "Bool"
        }
        else if typeString == "T@\"NSString\""
        {
            resultTypeString = "NSString"
        }
        else if typeString == "Tf"
        {
            resultTypeString = "Float"
        }
        else if typeString == "T@\"NSDecimalNumber\""
        {
            resultTypeString = "NSDecimalNumber"
        }
        else if typeString == "Ti"
        {
            resultTypeString = "Int32"
        }
        else
        {
            let temp = typeString.replacingOccurrences(of: "\"", with: "")
            resultTypeString = _classNameArray.first(where: { temp.hasSuffix($0) })
        }
        return resultTypeString
    }
}
