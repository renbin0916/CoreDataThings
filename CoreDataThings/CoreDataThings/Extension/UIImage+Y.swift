//
//  UIImage+Y.swift
//  CoreDataThings
//
//  Created by 任斌 on 2021/7/22.
//

import Foundation
import UIKit
import MobileCoreServices

extension UIImage
{
    public func y_imageToJpegData() -> Data?
    {
        return autoreleasepool { () -> Data? in
            return self.jpegData(compressionQuality: 1)
        }
    }
    
    public func y_imageToPNGData() -> Data?
    {
        return autoreleasepool { () -> Data in
            let data = NSMutableData()
            let options: NSDictionary = [kCGImagePropertyOrientation : 1,
                                         kCGImagePropertyHasAlpha : true]
            let imageRef = CGImageDestinationCreateWithData(data as CFMutableData, kUTTypePNG, 1, nil)!
            CGImageDestinationAddImage(imageRef, self.cgImage!, options)
            CGImageDestinationFinalize(imageRef)
            return data as Data
        }
    }
}
