//
//  Extenstions.swift
//  Instagram
//
//  Created by Vasil Panov on 21.2.21.
//

import UIKit

extension UIView {
    
    public var width : CGFloat {
        return frame.size.width
    }
    
    public var height : CGFloat {
        return frame.size.height
    }
    
    public var top : CGFloat {
        return frame.origin.y
    }
    
    public var bottom : CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public var left : CGFloat {
        return frame.origin.x
    }
    
    public var right : CGFloat {
        return frame.origin.x + frame.size.width
    }
}

extension String {
    
    /// Replaces all occurances of  a "." (dot) and a "@" (at) within a String and replaces it with a "-" (dash)
    /// - Returns  changed String\
     func safeDatabaseKey() -> String {
        return replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
}
