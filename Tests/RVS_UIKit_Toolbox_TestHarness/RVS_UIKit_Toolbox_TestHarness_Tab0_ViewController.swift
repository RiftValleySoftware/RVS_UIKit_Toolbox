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
     */
    @IBOutlet weak var normalColorSwitchLabel: UILabel?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var normalColorSegmentedSwitch: UISegmentedControl?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var selectedColorSwitchLabel: UILabel?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var selectedColorSegmentedSwitch: UISegmentedControl?
}

/* ###################################################################################################################################### */
// MARK: Instance Methods
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab0_ViewController {
    /* ################################################################## */
    /**
     Sets the tab bar to the colors selected in the switches.
     */
    func setTabBarColors() {
        var normalColor: UIColor?
        var selectedColor: UIColor?

        if let index = normalColorSegmentedSwitch?.selectedSegmentIndex {
            normalColor = UIColor(named: "Tint-\(index)")
        }
        
        if let index = selectedColorSegmentedSwitch?.selectedSegmentIndex {
            selectedColor = UIColor(named: "Tint-\(index)")
        }
        
        tabBarController?.setColorsTo(normal: normalColor, selected: selectedColor)
    }
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
        normalColorSwitchLabel?.text = normalColorSwitchLabel?.text?.localizedVariant
        for index in 0..<(normalColorSegmentedSwitch?.numberOfSegments ?? 0) {
            if let color = UIColor(named: "Tint-\(index)"),
               let image = UIImage(systemName: "square.fill")?.withTintColor(color) {
                normalColorSegmentedSwitch?.setImage(image.withRenderingMode(.alwaysOriginal), forSegmentAt: index)
            }
        }
        selectedColorSwitchLabel?.text = selectedColorSwitchLabel?.text?.localizedVariant
        for index in 0..<(selectedColorSegmentedSwitch?.numberOfSegments ?? 0) {
            if let color = UIColor(named: "Tint-\(index)"),
               let image = UIImage(systemName: "square.fill")?.withTintColor(color) {
                selectedColorSegmentedSwitch?.setImage(image.withRenderingMode(.alwaysOriginal), forSegmentAt: index)
            }
        }
        
        setTabBarColors()
    }
}

/* ###################################################################################################################################### */
// MARK: Callbacks
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab0_ViewController {
    /* ################################################################## */
    /**
     */
    @IBAction func colorSwitchChanged(_: Any) {
        setTabBarColors()
    }
}
