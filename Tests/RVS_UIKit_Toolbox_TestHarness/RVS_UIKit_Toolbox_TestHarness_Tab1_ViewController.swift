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
// MARK: - UIViewController Extension Test Harness View Controller -
/* ###################################################################################################################################### */
/**
 This controls the UIViewController Test tab.
 */
class RVS_UIKit_Toolbox_TestHarness_Tab1_ViewController: RVS_UIKit_Toolbox_TestHarness_Base_Tabs_ViewController {
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var bioReportLabel: UILabel?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var highContrastLabel: UILabel?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var reducedTransparencyLabel: UILabel?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var darkModeLabel: UILabel?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var screenAspectLabel: UILabel?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var voiceoverModeLabel: UILabel!

    /* ################################################################## */
    /**
     */
    @IBOutlet weak var rootViewControllerLabel: UILabel?

    /* ################################################################## */
    /**
     */
    @IBOutlet weak var areHapticsAvailableLabel: UILabel?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var nextNavBarButton: UIBarButtonItem?
    
    /* ################################################################## */
    /**
     Called when the view Hierarchy has been loaded.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        nextNavBarButton?.title = nextNavBarButton?.title?.localizedVariant
        navigationItem.title = navigationController?.tabBarItem.title
    }
    
    /* ################################################################## */
    /**
     Called when the view is about to lay out its subviews.
     */
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        bioReportLabel?.text = "SLUG-BIOREPORT-\((.none == biometricType) ? "NONE" : ((.faceID == biometricType) ? "FACEID" : "TOUCHID"))".localizedVariant
        highContrastLabel?.text = "SLUG-HIGHCONTRAST-\(isHighContrastMode ? "YES" : "NO")".localizedVariant
        reducedTransparencyLabel?.text = "SLUG-REDTRANS-\(isReducedTransparencyMode ? "YES" : "NO")".localizedVariant
        darkModeLabel?.text = "SLUG-DARK-\(isDarkMode ? "YES" : "NO")".localizedVariant
        screenAspectLabel?.text = String(format: "SLUG-SCREEN-ASPECT-FORMAT".localizedVariant, screenAspect)
        voiceoverModeLabel?.text = "SLUG-VMODE-\(isVoiceOverRunning ? "YES" : "NO")".localizedVariant
        rootViewControllerLabel?.text = (nil == previousViewController ? "SLUG-AT-ROOT" : "SLUG-ERROR-ROOT").localizedVariant
        areHapticsAvailableLabel?.text = "SLUG-HAPTICS-\(areHapticsAvailable ? "YES" : "NO")".localizedVariant
    }
}
