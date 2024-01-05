/*
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
*/

import UIKit
import RVS_Generic_Swift_Toolbox

/* ###################################################################################################################################### */
// MARK: - UIImage Extension Test Harness View Controller -
/* ###################################################################################################################################### */
/**
 This controls the UIImage Test tab.
 */
class RVS_UIKit_Toolbox_TestHarness_Tab3_ViewController: RVS_UIKit_Toolbox_TestHarness_Base_Tabs_ViewController {
    /* ################################################################################################################################## */
    // MARK: Scale Type Segmented Switch Values Enum
    /* ################################################################################################################################## */
    /**
     This defines enums for the seg switch values.
     */
    enum ScaleType: Int {
        /// The scaling will be done via the X-axis of each image.
        case width
        
        /// The scaling will be done via the Y-axis of each image
        case height
        
        /// The scaling will be done via a scale factor (simple multiplier coefficient)
        case factor
        
        /// The scaling will fit within a certain max height or width.
        case max
    }
    
    /* ################################################################## */
    /**
     This holds the JPEG image, shown in the top screen.
     */
    var jpegImage: UIImage?
    
    /* ################################################################## */
    /**
     This holds the SF Symbols image, shown in the bottom screen.
     */
    var sfSymbolImage: UIImage?
    
    /* ################################################################## */
    /**
     The label for the scale adjustment items.
     */
    @IBOutlet weak var scaleLabel: UILabel?
    
    /* ################################################################## */
    /**
     The segmented switch that determines the behavior of the slider.
     */
    @IBOutlet weak var scaleTypeSegmentedSwitch: UISegmentedControl?

    /* ################################################################## */
    /**
     The slider that adjusts the scale.
     */
    @IBOutlet weak var scaleSlider: UISlider?
    
    /* ################################################################## */
    /**
     The label for the alpha content report, over the JPEG Image.
     */
    @IBOutlet weak var jpegAlphaReportLabel: UILabel?
    
    /* ################################################################## */
    /**
     The image view for the raster (JPEG) image.
     */
    @IBOutlet weak var jpegImageView: UIImageView?

    /* ################################################################## */
    /**
     The label for the display of the pixel color of the raster (JPEG) image.
     */
    @IBOutlet weak var pixelReportLabel: UILabel?

    /* ################################################################## */
    /**
     The label for the alpha content report, over the SF Symbol Image.
     */
    @IBOutlet weak var sfSymbolAlphaReportLabel: UILabel?
    
    /* ################################################################## */
    /**
     The image view for the SFSymbol (Vector) image.
     */
    @IBOutlet weak var sfSymbolImageView: UIImageView?
}

/* ###################################################################################################################################### */
// MARK: Base Class Overrides
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab3_ViewController {
    /* ################################################################## */
    /**
     Called when the view Hierarchy has been loaded.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        scaleLabel?.text = scaleLabel?.text?.localizedVariant
        for segmentIndex in 0..<(scaleTypeSegmentedSwitch?.numberOfSegments ?? 0) {
            scaleTypeSegmentedSwitch?.setTitle("SLUG-SCALE-TYPE-\(segmentIndex)".localizedVariant, forSegmentAt: segmentIndex)
        }
        
        jpegImage = UIImage.assetOrSystemImage(name: "SLUG-JPEG-IMAGE-NAME".localizedVariant)
        sfSymbolImage = UIImage.assetOrSystemImage(name: "SLUG-SYSTEM-IMAGE-NAME".localizedVariant)?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 80))
        
        jpegAlphaReportLabel?.text = String(format: "SLUG-IMAGE-ALPHA-%@", (jpegImage?.hasAlphaInformation ?? false) ? "YES" : "NO").localizedVariant
        sfSymbolAlphaReportLabel?.text = String(format: "SLUG-IMAGE-ALPHA-%@", (sfSymbolImage?.hasAlphaInformation ?? false) ? "YES" : "NO").localizedVariant
        
        scaleTypeSegmentedSwitchChanged()
    }
}

/* ###################################################################################################################################### */
// MARK: Callbacks
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab3_ViewController {
    /* ################################################################## */
    /**
     Called when the scale type segment switch changes.
     This resets the slider to 100% image size.
     
     - parameter: Ignored (and can be omitted).
     */
    @IBAction func scaleTypeSegmentedSwitchChanged(_: Any! = nil) {
        scaleSlider?.minimumValue = -0.5
        scaleSlider?.maximumValue = 0.5
        scaleSlider?.value = 0
        scaleSliderChanged()
    }
    
    /* ################################################################## */
    /**
     Called when the scale slider changes.
     
     - parameter: Ignored (and can be omitted).
    */
    @IBAction func scaleSliderChanged(_: Any! = nil) {
        guard let value = scaleSlider?.value else { return }
        let scaleMultiplier = CGFloat(pow(10, value))
        if let jpegImageSize = jpegImage?.size,
           let sfSymbolImageSize = sfSymbolImage?.size,
           let scaleTypeIndex = scaleTypeSegmentedSwitch?.selectedSegmentIndex,
           let scaleType = ScaleType(rawValue: scaleTypeIndex) {
            switch scaleType {
            case .width:
                jpegImageView?.image = jpegImage?.resized(toNewWidth: jpegImageSize.width * scaleMultiplier)
                sfSymbolImageView?.image = sfSymbolImage?.resized(toNewWidth: sfSymbolImageSize.width * scaleMultiplier)

            case .height:
                jpegImageView?.image = jpegImage?.resized(toNewHeight: jpegImageSize.width * scaleMultiplier)
                sfSymbolImageView?.image = sfSymbolImage?.resized(toNewHeight: sfSymbolImageSize.width * scaleMultiplier)

            case .factor:
                jpegImageView?.image = jpegImage?.resized(toScaleFactor: scaleMultiplier)
                sfSymbolImageView?.image = sfSymbolImage?.resized(toScaleFactor: scaleMultiplier)

            case .max:
                jpegImageView?.image = jpegImage?.resized(toMaximumSize: max(jpegImageSize.width, jpegImageSize.height) * scaleMultiplier)
                sfSymbolImageView?.image = sfSymbolImage?.resized(toMaximumSize: max(sfSymbolImageSize.width, sfSymbolImageSize.height) * scaleMultiplier)
            }
        }
    }

    /* ################################################################## */
    /**
     Called when the user taps in the JPEG image.
     */
    @IBAction func jpegImageTapped(_ inTapGesture: UITapGestureRecognizer) {
        guard let tappedView = jpegImageView,
              let image = tappedView.image
        else {
            pixelReportLabel?.backgroundColor = .clear
            pixelReportLabel?.text = nil
            return
        }
        
        let location = inTapGesture.location(in: tappedView)
        
        guard location.x <= image.size.width,
              location.y <= image.size.height else {
            pixelReportLabel?.backgroundColor = .clear
            pixelReportLabel?.text = nil
            return
        }
        
        let newX = min(image.size.width, max(0, location.x))
        let newY = min(image.size.height, max(0, location.y))
        pixelReportLabel?.text = "(\(Int(newX)), \(Int(newY)))"
        pixelReportLabel?.backgroundColor = image.getRGBColorOfThePixel(at: CGPoint(x: newX, y: newY))
    }
}
