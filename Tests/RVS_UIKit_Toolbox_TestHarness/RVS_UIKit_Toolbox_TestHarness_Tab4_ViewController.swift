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
// MARK: - UIColor Extension Test Harness View Controller -
/* ###################################################################################################################################### */
/**
 This controls the UIColor Test tab.
 */
class RVS_UIKit_Toolbox_TestHarness_Tab4_ViewController: RVS_UIKit_Toolbox_TestHarness_Base_Tabs_ViewController {
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var color0Label: UILabel?

    /* ################################################################## */
    /**
     */
    @IBOutlet weak var color1Label: UILabel?

    /* ################################################################## */
    /**
     */
    @IBOutlet weak var color0TextEntry: UITextField?

    /* ################################################################## */
    /**
     */
    @IBOutlet weak var color1TextEntry: UITextField?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var color0DisplayView: UIView?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var color1DisplayView: UIView?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var interimColorSlider: UISlider?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var interimColorDisplayView: UIView?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var rgbLabelButton: UIButton?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var hsbLabelButton: UIButton?
    
    /* ################################################################## */
    /**
     */
    @IBOutlet weak var hsbRGBSwitch: UISwitch!
}

/* ###################################################################################################################################### */
// MARK: Base Class Overrides
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab4_ViewController {
    /* ################################################################## */
    /**
     Called when the view Hierarchy has been loaded.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        color0Label?.text = color0Label?.text?.localizedVariant
        color1Label?.text = color1Label?.text?.localizedVariant
        rgbLabelButton?.setTitle(rgbLabelButton?.title(for: .normal)?.localizedVariant, for: .normal)
        hsbLabelButton?.setTitle(hsbLabelButton?.title(for: .normal)?.localizedVariant, for: .normal)
        colorTextEntryChanged()
    }
}

/* ###################################################################################################################################### */
// MARK: Callbacks
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab4_ViewController {
    /* ################################################################## */
    /**
     */
    @IBAction func colorTextEntryChanged(_: Any! = nil) {
        guard let color0Hex = color0TextEntry?.text?.hexOnly,
              let color1Hex = color1TextEntry?.text?.hexOnly,
              let color0 = UIColor(hex: "#\(color0Hex)"),
              let color1 = UIColor(hex: "#\(color1Hex)")
        else { return }
        
        color0DisplayView?.backgroundColor = color0
        color1DisplayView?.backgroundColor = color1
        
        interimColorSlider?.minimumTrackTintColor = color0
        interimColorSlider?.maximumTrackTintColor = color1
        
        interimColorSliderChanged()
    }
    
    /* ################################################################## */
    /**
     */
    @IBAction func interimColorSliderChanged(_: Any! = nil) {
        guard let color0Hex = color0TextEntry?.text?.hexOnly,
              let color1Hex = color1TextEntry?.text?.hexOnly,
              let color0 = UIColor(hex: "#\(color0Hex)"),
              let color1 = UIColor(hex: "#\(color1Hex)"),
              let isHSL = hsbRGBSwitch?.isOn,
              let samplePoint = interimColorSlider?.value
        else {
            interimColorDisplayView?.backgroundColor = .clear
            return
        }
        
        interimColorDisplayView?.backgroundColor = color0.intermediateColor(otherColor: color1, samplePoint: CGFloat(samplePoint), isHSL: isHSL)
    }
    
    /* ################################################################## */
    /**
     */
    @IBAction func rgbLabelButtonHit(_: Any! = nil) {
        hsbRGBSwitch?.setOn(false, animated: true)
        hsbRGBSwitch?.sendActions(for: .valueChanged)
    }
    
    /* ################################################################## */
    /**
     */
    @IBAction func hsbRGBButtonHit(_: Any! = nil) {
        rgbLabelButton?.isEnabled = hsbRGBSwitch?.isOn ?? false
        hsbLabelButton?.isEnabled = !(hsbRGBSwitch?.isOn ?? true)
        interimColorSliderChanged()
    }
    
    /* ################################################################## */
    /**
     */
    @IBAction func hsbLabelButtonHit(_: Any! = nil) {
        hsbRGBSwitch?.setOn(true, animated: true)
        hsbRGBSwitch?.sendActions(for: .valueChanged)
    }
}
