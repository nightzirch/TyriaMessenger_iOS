//
//  TMGuildEmblem.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 02/10/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation

class TMGuildEmblem: NSObject, NSCoding {
    var backgroundID: Int = 0
    var backgroundColorID: Int = 0
    var foregroundID: Int = 0
    var foregroundPrimaryColorID: Int = 0
    var foregroundSecondaryColorID: Int = 0
    var flags: Array = [String]()
    
    override init() {
        super.init()
    }
    
    init(withBackgroundID backgroundID: Int, backgroundColorID: Int, foregroundID: Int, foregroundPrimaryColorID: Int, foregroundSecondaryColorID: Int, flags: [String]) {
        super.init()
        self.backgroundID = backgroundID
        self.backgroundColorID = backgroundColorID
        self.foregroundID = foregroundID
        self.foregroundPrimaryColorID = foregroundPrimaryColorID
        self.foregroundSecondaryColorID = foregroundSecondaryColorID
        self.flags = flags
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let backgroundID = aDecoder.decodeObjectForKey("backgroundID") as? Int ?? 0
        let backgroundColorID = aDecoder.decodeObjectForKey("backgroundColorID") as? Int ?? 0
        let foregroundID = aDecoder.decodeObjectForKey("foregroundID") as? Int ?? 0
        let foregroundPrimaryColorID = aDecoder.decodeObjectForKey("foregroundPrimaryColorID") as? Int ?? 0
        let foregroundSecondaryColorID = aDecoder.decodeObjectForKey("foregroundSecondaryColorID") as? Int ?? 0
        let flags = aDecoder.decodeObjectForKey("flags") as? [String] ?? [String]()
        
        self.init(withBackgroundID: backgroundID, backgroundColorID: backgroundColorID, foregroundID: foregroundID, foregroundPrimaryColorID: foregroundPrimaryColorID, foregroundSecondaryColorID: foregroundSecondaryColorID, flags: flags)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(backgroundID, forKey: "backgroundID")
        aCoder.encodeObject(backgroundColorID, forKey: "backgroundColorID")
        aCoder.encodeObject(foregroundID, forKey: "foregroundID")
        aCoder.encodeObject(foregroundPrimaryColorID, forKey: "foregroundPrimaryColorID")
        aCoder.encodeObject(foregroundSecondaryColorID, forKey: "foregroundSecondaryColorID")
        aCoder.encodeObject(flags, forKey: "flags")
    }
    
//    func getEmblemAsImage(imageA: UIImage, imageB: UIImage) -> UIImage {
//        var foreground = UIImage(named: "foreground-\(foregroundID)")
//        var background = UIImage(named: "background-\(backgroundID)")
//        
//        
//        let maskRef = imageA.CGImage
//        
//        let mask = CGImageMaskCreate(
//            CGImageGetWidth(maskRef),
//            CGImageGetHeight(maskRef),
//            CGImageGetBitsPerComponent(maskRef),
//            CGImageGetBitsPerPixel(maskRef),
//            CGImageGetBytesPerRow(maskRef),
//            CGImageGetDataProvider(maskRef),
//            nil,
//            false)
//        
//        let masked = CGImageCreateWithMask(imageB.CGImage, mask)
//        let maskedImage = UIImage(CGImage: masked!)
//        
//        return maskedImage
//            
//    }
}