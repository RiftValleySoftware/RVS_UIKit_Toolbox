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
// MARK: - UITabBarControllerController Extension Test Harness View Controller -
/* ###################################################################################################################################### */
/**
 This controls the UITabBarControllerController Test tab.
 */
class RVS_UIKit_Toolbox_TestHarness_Tab0_ViewController: RVS_UIKit_Toolbox_TestHarness_Base_Tabs_ViewController {
    /* ################################################################## */
    /**
     This is the square size for each of the color images.
     */
    private static let _colorImageSizeInDisplayUnits = CGFloat(16)
    
    /* ################################################################## */
    /**
     The label for the background color segmented switch.
     */
    @IBOutlet weak var backgroundColorSwitchLabel: UILabel?
    
    /* ################################################################## */
    /**
     The background color segmented switch.
     */
    @IBOutlet weak var backgroundColorSegmentedSwitch: UISegmentedControl?
    
    /* ################################################################## */
    /**
     The label for the selected color segmented switch.
     */
    @IBOutlet weak var selectedColorSwitchLabel: UILabel?
    
    /* ################################################################## */
    /**
     The selected color segmented switch.
     */
    @IBOutlet weak var selectedColorSegmentedSwitch: UISegmentedControl?

    /* ################################################################## */
    /**
     The label for the normal color segmented switch.
     */
    @IBOutlet weak var normalColorSwitchLabel: UILabel?
    
    /* ################################################################## */
    /**
     The normal color segmented switch.
     */
    @IBOutlet weak var normalColorSegmentedSwitch: UISegmentedControl?
}

/* ###################################################################################################################################### */
// MARK: Base Class Overrides
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab0_ViewController {
    /* ################################################################## */
    /**
     Called when the view Hierarchy has been loaded.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColorSwitchLabel?.text = backgroundColorSwitchLabel?.text?.localizedVariant
        for index in 0..<(backgroundColorSegmentedSwitch?.numberOfSegments ?? 0) {
            if 0 == index,
               let image = UIImage(systemName: "square")?.withTintColor(.black) {
                backgroundColorSegmentedSwitch?.setImage(image.withRenderingMode(.alwaysOriginal), forSegmentAt: index)
            } else if let color = UIColor(named: "Tint-\(index)"),
                      let image = UIImage(color: color)?.resized(toNewWidth: Self._colorImageSizeInDisplayUnits) {  // We test the 1 X 1 default, here.
                backgroundColorSegmentedSwitch?.setImage(image.withRenderingMode(.alwaysOriginal), forSegmentAt: index)
            }
        }
        
        selectedColorSwitchLabel?.text = selectedColorSwitchLabel?.text?.localizedVariant
        for index in 0..<(selectedColorSegmentedSwitch?.numberOfSegments ?? 0) {
            if 0 == index,
               let image = UIImage(systemName: "square")?.withTintColor(.black) {
                selectedColorSegmentedSwitch?.setImage(image.withRenderingMode(.alwaysOriginal), forSegmentAt: index)
            } else if let color = UIColor(named: "Tint-\(index)"),
                      let image = UIImage(color: color, size: CGSize(width: Self._colorImageSizeInDisplayUnits, height: Self._colorImageSizeInDisplayUnits)) {
                selectedColorSegmentedSwitch?.setImage(image.withRenderingMode(.alwaysOriginal), forSegmentAt: index)
            }
        }
        
        normalColorSwitchLabel?.text = normalColorSwitchLabel?.text?.localizedVariant
        for index in 0..<(normalColorSegmentedSwitch?.numberOfSegments ?? 0) {
            if 0 == index,
               let image = UIImage(systemName: "square")?.withTintColor(.black) {
                normalColorSegmentedSwitch?.setImage(image.withRenderingMode(.alwaysOriginal), forSegmentAt: index)
            } else if let color = UIColor(named: "Tint-\(index)"),
               let image = UIImage(color: color, size: CGSize(width: Self._colorImageSizeInDisplayUnits, height: Self._colorImageSizeInDisplayUnits)) {
                normalColorSegmentedSwitch?.setImage(image.withRenderingMode(.alwaysOriginal), forSegmentAt: index)
            }
        }
        
        colorSwitchChanged()
    }
}

/* ###################################################################################################################################### */
// MARK: Callbacks
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab0_ViewController {
    /* ################################################################## */
    /**
     Called to check the color segmented switches, and set the tab bar to their values.
     
     - parameter: Ignored (and can be omitted).
     */
    @IBAction func colorSwitchChanged(_: Any! = nil) {
        var backgroundColor: UIColor? = .clear
        var selectedColor: UIColor? = .black
        var normalColor: UIColor? = .white
        
        if let index = backgroundColorSegmentedSwitch?.selectedSegmentIndex {
            if 0 == index {
                backgroundColor = .clear
            } else {
                backgroundColor = UIColor(named: "Tint-\(index)")
            }
        }
        
        if let index = selectedColorSegmentedSwitch?.selectedSegmentIndex {
            if 0 == index {
                selectedColor = .clear
            } else {
                selectedColor = UIColor(named: "Tint-\(index)")
            }
        }

        if let index = normalColorSegmentedSwitch?.selectedSegmentIndex {
            if 0 == index {
                normalColor = .clear
            } else {
                normalColor = UIColor(named: "Tint-\(index)")
            }
        }

        tabBarController?.setColorsTo(normal: normalColor, selected: selectedColor, background: backgroundColor)
    }
}
