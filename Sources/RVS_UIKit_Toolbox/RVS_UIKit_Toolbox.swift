/**
© Copyright 2022, The Great Rift Valley Software Company

LICENSE:

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

The Great Rift Valley Software Company: https://riftvalleysoftware.com
 
Version: 1.2.0
*/

import UIKit
import LocalAuthentication
import CoreHaptics

/* ###################################################################################################################################### */
// MARK: - UITabBarController Extension -
/* ###################################################################################################################################### */
/**
 An extension to [the standard UITabBarController class](https://developer.apple.com/documentation/uikit/uitabbarcontroller).
 This adds a method to ease customization of bar colors.
 */
public extension UITabBarController {
    /* ################################################################## */
    /**
     This allows us to set specific colors for the normal, selected, and background attributes of the tab bar.
     All parameters are optional. If not provided, default values for the current theme are used.
     - parameters:
        - normal: The color to use for an unselected, enabled tab item.
        - selected: The color to use for a selected tab item.
        - background: The background color to use for the bar.
     */
    func setColorsTo(normal inNormalColor: UIColor? = nil,
                     selected inSelectedColor: UIColor? = nil,
                     background inBackgroundColor: UIColor? = nil) {

        let appearance = UITabBarAppearance()

        appearance.configureWithOpaqueBackground()
        
        if let backgroundColor = inBackgroundColor {
            appearance.backgroundColor = backgroundColor
        }

        if let normalColor = inNormalColor {
            appearance.stackedLayoutAppearance.normal.iconColor = normalColor
            appearance.inlineLayoutAppearance.normal.iconColor = normalColor
            appearance.compactInlineLayoutAppearance.normal.iconColor = normalColor
            let normalTextAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: normalColor]
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalTextAttributes
            appearance.inlineLayoutAppearance.normal.titleTextAttributes = normalTextAttributes
            appearance.compactInlineLayoutAppearance.normal.titleTextAttributes = normalTextAttributes
        }
        
        if let selectedColor = inSelectedColor {
            appearance.stackedLayoutAppearance.selected.iconColor = selectedColor
            appearance.inlineLayoutAppearance.selected.iconColor = selectedColor
            appearance.compactInlineLayoutAppearance.selected.iconColor = selectedColor
            let selectedTextAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: selectedColor]
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedTextAttributes
            appearance.inlineLayoutAppearance.selected.titleTextAttributes = selectedTextAttributes
            appearance.compactInlineLayoutAppearance.selected.titleTextAttributes = selectedTextAttributes
        }

        tabBar.standardAppearance = appearance

        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
        
        tabBar.setNeedsLayout() // This is required, because otherwise, the items don't refresh.
    }
}

/* ###################################################################################################################################### */
// MARK: - UIViewController Extension -
/* ###################################################################################################################################### */
/**
 A set of various extensions of [the UIViewController class](https://developer.apple.com/documentation/uikit/uiviewcontroller).
 These provide utilities for determining running state of the device, biometric support, and some responder stuff.
 */
public extension UIViewController {
    // MARK: Class Computed Properties
    /* ################################################################## */
    /**
     Get the biometric authentication type.
     
     Possible Values:
        - .none (no biometrics)
        - .touchID (Touch ID)
        - .faceID (Face ID)
     */
    class var biometricType: LABiometryType {
        let authenticationContext = LAContext()
        var error: NSError?
        
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else { return .none }

        return authenticationContext.biometryType
    }
    
    /* ################################################################## */
    /**
     Returns true, if we are in High Contrast Mode.
     */
    class var isHighContrastMode: Bool { UIAccessibility.isDarkerSystemColorsEnabled }
    
    /* ################################################################## */
    /**
     Returns true, if we are in Reduced Transparency Mode.
     */
    class var isReducedTransparencyMode: Bool { UIAccessibility.isReduceTransparencyEnabled }

    /* ################################################################## */
    /**
     Returns true, if voiceover mode is on.
     */
    class var isVoiceOverRunning: Bool { UIAccessibility.isVoiceOverRunning }

    /* ################################################################## */
    /**
     Returns true, if iCloud is available, and logged-in.
     
     *NOTE: If iCloud is available, but the user is not logged in, this will also return false.*
     */
    class var isICloudAvailable: Bool { nil != FileManager.default.ubiquityIdentityToken }

    // MARK: System State Flag Instance Computed Properties
    /* ################################################################## */
    /**
     Get the biometric authentication type.
     
     Possible Values:
        - .none (no biometrics)
        - .touchID (Touch ID)
        - .faceID (Face ID)
     */
    var biometricType: LABiometryType { Self.biometricType }
    
    /* ################################################################## */
    /**
     Returns true, if we are in High Contrast Mode.
     */
    var isHighContrastMode: Bool { Self.isHighContrastMode }
    
    /* ################################################################## */
    /**
     Returns true, if we are in Reduced Transparency Mode.
     */
    var isReducedTransparencyMode: Bool { Self.isReducedTransparencyMode }

    /* ################################################################## */
    /**
     Returns true, if voiceover mode is on.
     */
    var isVoiceOverRunning: Bool { Self.isVoiceOverRunning }

    /* ################################################################## */
    /**
     Returns true, if iCloud is available, and logged-in.
     
     *NOTE: If iCloud is available, but the user is not logged in, this will also return false.*
     */
    var isICloudAvailable: Bool { Self.isICloudAvailable }

    // MARK: These are only available in instances
    /* ################################################################## */
    /**
     Returns true, if we are in Dark Mode.
     */
    var isDarkMode: Bool { .dark == traitCollection.userInterfaceStyle }

    /* ################################################################## */
    /**
     Returns true, if haptics are available.
     */
    var hapticsAreAvailable: Bool { CHHapticEngine.capabilitiesForHardware().supportsHaptics }
    
    // MARK: Device Instance Computed Properties
    /* ################################################################## */
    /**
     Returns the X/Y aspect of the screen (window). It will return 0, if it cannot determine the aspect.
     */
    var screenAspect: CGFloat { view?.screenAspect ?? 0 }

    // MARK: View Hierarchy Instance Computed Properties
    /* ################################################################## */
    /**
     Returns the previous ViewController in a navigation stack.
     Nil, if at root, or not in a navigation stack.
     Inspired by [this SO answer](https://stackoverflow.com/a/42916780/879365).
     */
    var previousViewController: UIViewController? {
        guard let viewControllers = navigationController?.viewControllers,
              1 < viewControllers.count  else { return nil }
        
        return viewControllers[viewControllers.count - 2]
    }

    // MARK: Responder Stuff
    /* ################################################################## */
    /**
     This returns the first responder, wherever it is in our hierarchy.
     */
    var currentFirstResponder: UIResponder? { view?.currentFirstResponder }

    /* ################################################################## */
    /**
     This puts away any open keyboards.
     This is different from the UIView version, as it also forces [`endEditing(_:)`](https://developer.apple.com/documentation/uikit/uiview/1619630-endediting).
     */
    func resignAllFirstResponders() {
        view?.resignAllFirstResponders()
        view?.endEditing(true)
    }
}

/* ###################################################################################################################################### */
// MARK: - UIView Extension -
/* ###################################################################################################################################### */
/**
 A set of extensions to [the UIView class](https://developer.apple.com/documentation/uikit/uiview).
 It has a few "informational" computed properties, and some other simple tools for things like auto layout.
 */
public extension UIView {
    // MARK: IBInspectable Computed Instance Properties
    /* ################################################################## */
    /**
     This gives us access to the corner radius, so we can give the view rounded corners.
     
     > This requires that `clipsToBounds` be set.
     */
    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            setNeedsDisplay()
        }
    }
    
    /* ################################################################## */
    /**
     Inspired by [this SO answer](https://stackoverflow.com/a/45089222/879365)
     This allows us to specify a border for the view. It is width, in display units.
     */
    @IBInspectable var borderWidth: CGFloat {
        get { layer.borderWidth }
        set {
            layer.borderWidth = newValue
            setNeedsDisplay()
        }
    }

    /* ################################################################## */
    /**
     Inspired by [this SO answer](https://stackoverflow.com/a/45089222/879365)
     This allows us to assign a color to any border that is of a width greater than 0 display units.
     */
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
            setNeedsDisplay()
        }
    }
    
    // MARK: Screen Stuff
    /* ################################################################## */
    /**
     Returns the X/Y aspect of the screen (window). It will return 0, if it cannot determine the aspect.
     */
    var screenAspect: CGFloat { (window?.bounds.size.width ?? 0) / (window?.bounds.size.height ?? 1) }

    // MARK: Responder Stuff
    /* ################################################################## */
    /**
     This returns the first responder, wherever it is in our hierarchy.
     */
    var currentFirstResponder: UIResponder? {
        for responder in subviews where nil != responder.currentFirstResponder {
            return responder.currentFirstResponder
        }
        
        return isFirstResponder ? self : nil
    }

    /* ################################################################## */
    /**
     This puts away any open keyboards.
     */
    func resignAllFirstResponders() {
        if let firstResponder = currentFirstResponder {
            firstResponder.resignFirstResponder()
        } else {
            subviews.forEach { $0.resignAllFirstResponders() }
        }
    }

    // MARK: Auto Layout Instance Methods
    /* ################################################################## */
    /**
     This allows us to add a subview, and set it up with auto-layout constraints to fill the superview.
     
     - parameter inSubview: The subview we want to add.
     - parameter underThis: If supplied, this is a Y-axis anchor to use as the attachment of the top anchor.
                            Default is nil (can be omitted, which will simply attach to the top of the container).
     - parameter andGiveMeABottomHook: If this is true, then the bottom anchor of the subview will not be attached to anything, and will simply be returned.
                                       Default is false, which means that the bottom anchor will simply be attached to the bottom of the view.
     - returns: The bottom hook, if requested. Can be ignored.
     */
    @discardableResult
    func addContainedView(_ inSubView: UIView, underThis inUpperConstraint: NSLayoutYAxisAnchor? = nil, andGiveMeABottomHook inBottomLoose: Bool = false) -> NSLayoutYAxisAnchor? {
        addSubview(inSubView)
        
        inSubView.translatesAutoresizingMaskIntoConstraints = false
        if let underConstraint = inUpperConstraint {
            inSubView.topAnchor.constraint(equalTo: underConstraint, constant: 0).isActive = true
        } else {
            inSubView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        }
        inSubView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        inSubView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        if inBottomLoose {
            return inSubView.bottomAnchor
        } else {
            inSubView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        }
        
        return nil
    }

    /* ################################################################## */
    /**
     This creates a constraint, locking the view to a given aspect ratio.
     - parameter aspectRatio: The aspect ratio. It is W/H, so numbers less than 1.0 are wider than tall, and numbers greater than 1.0 are taller than wide.
     - returns: An inactive constraint, locking this view to the given aspect ratio.
     */
    func autoLayoutAspectConstraint(aspectRatio inAspect: CGFloat) -> NSLayoutConstraint? {
        guard 0.0 < inAspect else { return nil }
        
        return NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: inAspect, constant: 0)
    }
}

/* ###################################################################################################################################### */
// MARK: - UIImage Extension -
/* ###################################################################################################################################### */
/**
 A set of extensions to [the UIImage class](https://developer.apple.com/documentation/uikit/uiimage).
 This mostly has resizing stuff, but also a bit of pixel-level inspection.
 */
public extension UIImage {
    // MARK: Class Functions
    /* ################################################################## */
    /**
     This is a "cascading" image fetcher. It first, ses if there is an asset with the name given, then, it looks in the SFSymbols, finally, returning the SFSymbols.nosign, if none found.
     
     - parameter name: The name of the resource.
     
     - returns: A new image. May be nil, if none found.
     */
    class func assetOrSystemImage(name inName: String) -> UIImage? { UIImage(named: inName) ?? UIImage(systemName: inName) ?? UIImage(systemName: "nosign") }
    
    // MARK: Image Composition Instance Computed Properties
    /* ################################################################## */
    /**
     - returns: True, if the image has an alpha component.
                **NOTE:** The Photos app seems to have a bug, where it won't see alpha information of monchrome (black and white) PNG images with alpha channels.
     */
    var hasAlphaInformation: Bool {
        guard let cgImage = cgImage else { return false }
        let alpha = cgImage.alphaInfo
        return alpha == .first || alpha == .last || alpha == .premultipliedFirst || alpha == .premultipliedLast
    }
    
    // MARK: Pixel Information Instance Methods
    /* ################################################################## */
    /**
     This returns the RGB color (as a UIColor) of the pixel in the image, at the given point. It is restricted to 32-bit (RGBA/8-bit pixel) values.
     
     This was inspired by several of the answers [in this StackOverflow Question](https://stackoverflow.com/questions/25146557/how-do-i-get-the-color-of-a-pixel-in-a-uiimage-with-swift).
     
     **NOTE:** This is unlikely to be highly performant!
     
     - parameter at: The point in the image to sample (NOTE: Must be within image bounds, or nil is returned).
     - returns: A UIColor (or nil).
     */
    func getRGBColorOfThePixel(at inPoint: CGPoint) -> UIColor? {
        guard (0..<size.width).contains(inPoint.x),
              (0..<size.height).contains(inPoint.y)
        else { return nil }

        // We draw the image into a context, in order to be sure that we are accessing image data in our required format (BGRA or ARGB).
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        draw(at: .zero)
        let imageData = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let bitsPerPixel = imageData?.cgImage?.bitsPerPixel,
              let bitsPerComponent = imageData?.cgImage?.bitsPerComponent,
              let bytesPerRow = imageData?.cgImage?.bytesPerRow,
              let bitmapInfo = imageData?.cgImage?.bitmapInfo,
              // Even though we are using flexible addressing, things are expected to be a simple 32-bit, 4-8-bit-element pixel. If we will be changing pixel depth, we'll need to change the data pointer type.
              bitmapInfo.contains(.byteOrder32Big) || bitmapInfo.contains(.byteOrder32Little),
              let data = CFDataGetBytePtr(imageData?.cgImage?.dataProvider?.data)
        else { return nil }
        
        let bytesPerPixel = (bitsPerPixel + (bitsPerComponent - 1)) / bitsPerComponent
        let pixelByteOffset = (bytesPerRow * Int(inPoint.y)) + (Int(inPoint.x) * bytesPerPixel)
        let divisor = CGFloat(1 << bitsPerComponent) - 1
        
        var r, g, b, a: CGFloat
        
        if bitmapInfo.contains(.byteOrder32Little) {
            b = CGFloat(data[pixelByteOffset]) / divisor
            g = CGFloat(data[pixelByteOffset + 1]) / divisor
            r = CGFloat(data[pixelByteOffset + 2]) / divisor
            a = CGFloat(data[pixelByteOffset + 3]) / divisor
        } else {
            a = CGFloat(data[pixelByteOffset]) / divisor
            r = CGFloat(data[pixelByteOffset + 1]) / divisor
            g = CGFloat(data[pixelByteOffset + 2]) / divisor
            b = CGFloat(data[pixelByteOffset + 3]) / divisor
        }

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }

    // MARK: Sizing Instance Methods
    /* ################################################################## */
    /**
     This allows an image to be resized, given a maximum dimension, and a scale will be determined to meet that dimension.
     If the image is currently smaller than the maximum size, it will not be scaled.
     
     - parameter toMaximumSize: The maximum size, in either the X or Y axis, of the image, in pixels.
     
     - returns: A new image, with the given dimensions. May be nil, if there was an error.
     */
    func resized(toMaximumSize: CGFloat) -> UIImage? {
        let scaleX: CGFloat = toMaximumSize / size.width
        let scaleY: CGFloat = toMaximumSize / size.height
        return resized(toScaleFactor: min(1.0, min(scaleX, scaleY)))
    }

    /* ################################################################## */
    /**
     This allows an image to be resized, given a maximum dimension, and a scale will be determined to meet that dimension.
     
     - parameter toScaleFactor: The scale of the resulting image, as a multiplier of the current size.
     
     - returns: A new image, with the given scale. May be nil, if there was an error.
     */
    func resized(toScaleFactor inScaleFactor: CGFloat) -> UIImage? { resized(toNewWidth: size.width * inScaleFactor, toNewHeight: size.height * inScaleFactor) }
    
    /* ################################################################## */
    /**
     This allows an image to be resized, given both a width and a height, or just one of the dimensions.
     
     - parameters:
         - toNewWidth: The width (in pixels) of the desired image. If not provided, a scale will be determined from the toNewHeight parameter.
         - toNewHeight: The height (in pixels) of the desired image. If not provided, a scale will be determined from the toNewWidth parameter.
     
     - returns: A new image, with the given dimensions. May be nil, if no width or height was supplied, or if there was an error.
     */
    func resized(toNewWidth inNewWidth: CGFloat? = nil, toNewHeight inNewHeight: CGFloat? = nil) -> UIImage? {
        guard nil == inNewWidth,
              nil == inNewHeight else {
            var scaleX: CGFloat = (inNewWidth ?? size.width) / size.width
            var scaleY: CGFloat = (inNewHeight ?? size.height) / size.height

            scaleX = nil == inNewWidth ? scaleY : scaleX
            scaleY = nil == inNewHeight ? scaleX : scaleY

            let destinationSize = CGSize(width: size.width * scaleX, height: size.height * scaleY)
            let destinationRect = CGRect(origin: .zero, size: destinationSize)

            UIGraphicsBeginImageContextWithOptions(destinationSize, false, 0)
            defer { UIGraphicsEndImageContext() }   // This makes sure that we get rid of the offscreen context.
            draw(in: destinationRect, blendMode: .normal, alpha: 1)
            return UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(renderingMode)
        }
        
        return nil
    }
}

/* ###################################################################################################################################### */
// MARK: - UIColor Extension -
/* ###################################################################################################################################### */
/**
 A set of extensions to [the UIColor class](https://developer.apple.com/documentation/uikit/uicolor).
 This mostly has ways of inspecting the color.
 */
public extension UIColor {
    // MARK: Convenience Initializers
    /* ################################################################## */
    /**
     [This comes fairly directly from this Hacking With Swift tutorial](https://www.hackingwithswift.com/example-code/uicolor/how-to-convert-a-hex-color-to-a-uicolor)
     - parameter hex: The hex number, as a String "#RRGGBB[AA]"
     - returns: The color, from the hex string.
     */
    convenience init?(hex inHexNumber: String) {
        let r, g, b, a: CGFloat
        
        var hexString = inHexNumber.uppercased()
        
        guard hexString.hasPrefix("#"),
              6 < hexString.count
        else { return nil }
        
        if 8 > hexString.count {
            hexString += "FF"
        }
        
        if hexString.count == 9 {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }

    // MARK: Color Information Instance Computed Properties
    /* ################################################################## */
    /**
     - returns: the color, as an RGBA hex value in a String, prefixed by a hash sign ("#RRGGBBAA").
     */
    var hexValue: String {
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        guard getRed(&r, green: &g, blue: &b, alpha: &a) else { return "" }
        
        let redVal = UInt64(ceil(r * 255)) << 24
        let greenVal = UInt64(ceil(g * 255)) << 16
        let blueVal = UInt64(ceil(b * 255)) << 8
        let alphaVal = UInt64(ceil(a * 255))

        return String(format: "#%08X", redVal + greenVal + blueVal + alphaVal)
    }
    
    /* ################################################################## */
    /**
     - returns: true, if the color is clear.
     */
    var isClear: Bool {
        var (white, h, s, b, a): (CGFloat, CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0, 0)
        if !getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            return 0.0 == a
        } else if getWhite(&white, alpha: &a) {
            return 0.0 == a
        }
        
        return false
    }
    
    /* ################################################################## */
    /**
     - returns: True, if the color is monochrome (has no hue).
     */
    var isMonochrome: Bool {
        var (h, s, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        return getHue(&h, saturation: &s, brightness: &b, alpha: &a) ? 0 == h : false
    }

    /* ################################################################## */
    /**
     This just allows us to get an RGB color from a standard UIColor.
     
     - returns: A tuple, containing the RGBA color.
     */
    var rgba: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        return getRed(&r, green: &g, blue: &b, alpha: &a) ? (r: r, g: g, b: b, a: a) : (r: 0, g: 0, b: 0, a: 0)
    }
    
    /* ################################################################## */
    /**
     This just allows us to get an HSB color from a standard UIColor.
     [From This SO Answer](https://stackoverflow.com/a/30713456/879365)
     
     - returns: A tuple, containing the HSBA color.
     */
    var hsba: (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) {
        var (h, s, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        return getHue(&h, saturation: &s, brightness: &b, alpha: &a) ? (h: h, s: s, b: b, a: a) : (h: 0, s: 0, b: 0, a: 0)
    }

    /* ################################################################## */
    /**
     Returns the inverted color.
     NOTE: This is quite primitive, and may not return exactly what may be expected.
     [From This SO Answer](https://stackoverflow.com/a/57111280/879365)
     */
    var inverted: UIColor {
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        return getRed(&r, green: &g, blue: &b, alpha: &a) ? UIColor(red: 1.0-r, green: 1.0-g, blue: 1.0-b, alpha: a) : .clear
    }

    // MARK: Color Computation Instance Methods
    /* ################################################################## */
    /**
     This will return an intermediate color, between this color, and another one.
     
     [This was inspired by this SO answer](https://stackoverflow.com/a/46729248/879365)
     - parameter otherColor: The other end of the color spectrum we are testing.
     - parameter samplePoint: Optional (default is 50%). The distance betweeen 0 (this color), and 1 (otherColor).
     - parameter isHSL: Optional (default is true). If true, then the intermediate color is determined via HSL. If false, we use RGB.
     - returns: the intermediate color.
     */
    func intermediateColor(otherColor inColor: UIColor, samplePoint inSamplePoint: CGFloat = 0.5, isHSL inIsHSL: Bool = true) -> UIColor {
        let samplePoint = max(0, min(1, inSamplePoint))
        
        guard 0 < samplePoint else { return self }
        guard 1 > samplePoint else { return inColor }
        
        if inIsHSL {
            var (h1, s1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            var (h2, s2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            guard getHue(&h1, saturation: &s1, brightness: &b1, alpha: &a1),
                  inColor.getHue(&h2, saturation: &s2, brightness: &b2, alpha: &a2)
            else { return self }

            return UIColor(hue: CGFloat(h1 + (h2 - h1) * samplePoint),
                           saturation: CGFloat(s1 + (s2 - s1) * samplePoint),
                           brightness: CGFloat(b1 + (b2 - b1) * samplePoint),
                           alpha: CGFloat(a1 + (a2 - a1) * samplePoint)
            )
        } else {
            var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            guard getRed(&r1, green: &g1, blue: &b1, alpha: &a1),
                  inColor.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
            else { return self }

            return UIColor(red: CGFloat(r1 + (r2 - r1) * samplePoint),
                           green: CGFloat(g1 + (g2 - g1) * samplePoint),
                           blue: CGFloat(b1 + (b2 - b1) * samplePoint),
                           alpha: CGFloat(a1 + (a2 - a1) * samplePoint)
            )
        }
    }
}
