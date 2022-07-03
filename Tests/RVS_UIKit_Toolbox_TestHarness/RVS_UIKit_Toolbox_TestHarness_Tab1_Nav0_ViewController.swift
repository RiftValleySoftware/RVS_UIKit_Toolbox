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
class RVS_UIKit_Toolbox_TestHarness_Tab1_Nav0_ViewController: RVS_UIKit_Toolbox_TestHarness_Base_Tabs_ViewController {
    /* ################################################################## */
    /**
     The label that reports on the previous navigation view controller.
     */
    @IBOutlet weak var navigationLabel: UILabel?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var editText0: UITextField?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var editFlagImageView0: UIImageView!
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var editText1: UITextField?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var editFlagImageView1: UIImageView!
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var editText2: UITextField?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var editFlagImageView2: UIImageView!
    @IBOutlet weak var responderErrorLabel: UILabel!
}

/* ###################################################################################################################################### */
// MARK: Base Class Overrides
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab1_Nav0_ViewController {
    /* ################################################################## */
    /**
     Called when the view is about to lay out its subviews.
     */
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationLabel?.text = String(format: "SLUG-PREVIOUS-FORMAT".localizedVariant, previousViewController?.navigationItem.title ?? "ERROR")
        responderErrorLabel?.text = responderErrorLabel?.text?.localizedVariant
        responderErrorLabel?.isHidden = true
    }
}

/* ###################################################################################################################################### */
// MARK: Callbacks
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab1_Nav0_ViewController {
    /* ################################################################## */
    /**
     Called when the background is tapped. Closes the keyboard, and deselects the first responder.
     */
    @IBAction func closeKeyboard(_: Any! = nil) {
        resignAllFirstResponders()
        editFlagImageView0?.image = UIImage(systemName: "circle")
        editFlagImageView1?.image = UIImage(systemName: "circle")
        editFlagImageView2?.image = UIImage(systemName: "circle")
        if nil != currentFirstResponder {
            responderErrorLabel?.isHidden = false
        }
    }
}

/* ###################################################################################################################################### */
// MARK: Base Class Overrides
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab1_Nav0_ViewController: UITextFieldDelegate {
    /* ################################################################## */
    /**
     */
    func textFieldDidBeginEditing(_ inTextField: UITextField) {
        if nil != currentFirstResponder {
            responderErrorLabel?.isHidden = true
            switch inTextField {
            case editText0:
                editFlagImageView0?.image = UIImage(systemName: "circle.fill")
                editFlagImageView1?.image = UIImage(systemName: "circle")
                editFlagImageView2?.image = UIImage(systemName: "circle")
                
            case editText1:
                editFlagImageView0?.image = UIImage(systemName: "circle")
                editFlagImageView1?.image = UIImage(systemName: "circle.fill")
                editFlagImageView2?.image = UIImage(systemName: "circle")
                
            case editText2:
                editFlagImageView0?.image = UIImage(systemName: "circle")
                editFlagImageView1?.image = UIImage(systemName: "circle")
                editFlagImageView2?.image = UIImage(systemName: "circle.fill")
                
            default:
                editFlagImageView0?.image = UIImage(systemName: "circle")
                editFlagImageView1?.image = UIImage(systemName: "circle")
                editFlagImageView2?.image = UIImage(systemName: "circle")
            }
        } else {
            responderErrorLabel?.isHidden = false
        }
    }
}
