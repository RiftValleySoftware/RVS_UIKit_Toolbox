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
     The image view for the raster (JPEG) image.
     */
    @IBOutlet weak var jpegImageView: UIImageView?
    
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
        
        jpegImageView?.image = UIImage.assetOrSystemImage(name: "SLUG-JPEG-IMAGE-NAME".localizedVariant)
        sfSymbolImageView?.image = UIImage.assetOrSystemImage(name: "SLUG-SYSTEM-IMAGE-NAME".localizedVariant)
    }
}

/* ###################################################################################################################################### */
// MARK: Callbacks
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab3_ViewController {
    /* ################################################################## */
    /**
     Called when the scale type segment switch changes.
     
     - parameter: Ignored.
     */
    @IBAction func scaleTypeSegmentedSwitchChanged(_: Any) {
    }
    
    /* ################################################################## */
    /**
     Called when the scale slider changes.
     
     - parameter: Ignored.
    */
    @IBAction func scaleSliderChanged(_: Any) {
    }
}
