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
     This is the label for the first color text entry.
    */
    @IBOutlet weak var color0Label: UILabel?

    /* ################################################################## */
    /**
     This is the label for the second color text entry.
     */
    @IBOutlet weak var color1Label: UILabel?

    /* ################################################################## */
    /**
     This text field allows you to enter a hex value, for the first color.
     */
    @IBOutlet weak var color0TextEntry: UITextField?

    /* ################################################################## */
    /**
     This text field allows you to enter a hex value, for the second color.
     */
    @IBOutlet weak var color1TextEntry: UITextField?
    
    /* ################################################################## */
    /**
     This uses the background color to give a visual representation of the first color.
     */
    @IBOutlet weak var color0DisplayView: UIView?
    
    /* ################################################################## */
    /**
     This uses the background color to give a visual representation of the second color.
     */
    @IBOutlet weak var color1DisplayView: UIView?
    
    /* ################################################################## */
    /**
     This is the label for the first color text entry "is clear" flag.
     */
    @IBOutlet weak var color0IsClearLabel: UILabel?

    /* ################################################################## */
    /**
     This is the label for the second color text entry "is clear" flag.
     */
    @IBOutlet weak var color1IsClearLabel: UILabel?
    
    /* ################################################################## */
    /**
     This is the label for the first color text entry "is monochrome" flag.
     */
    @IBOutlet weak var color0IsMonochromeLabel: UILabel?
    
    /* ################################################################## */
    /**
     This is the label for the second color text entry "is monochrome" flag.
     */
    @IBOutlet weak var color1IsMonochromeLabel: UILabel?
    
    /* ################################################################## */
    /**
     This slider changes the sample point of the interim color.
     */
    @IBOutlet weak var interimColorSlider: UISlider?
    
    /* ################################################################## */
    /**
     The view that displays the current interim color (as a background color).
     */
    @IBOutlet weak var interimColorDisplayView: UIView?
    
    /* ################################################################## */
    /**
     The label that displays the current interim color (as numerical values).
     */
    @IBOutlet weak var interimColorDisplayLabel: UILabel?
    
    /* ################################################################## */
    /**
     The label for the inverted section.
     */
    @IBOutlet weak var invertedLabel: UILabel?
    
    /* ################################################################## */
    /**
     The view that displays the current inverted interim color (as a background color).
     */
    @IBOutlet weak var invertedInterimColorDisplayView: UIView?
    
    /* ################################################################## */
    /**
     The label that displays the current inverted interim color (as numerical values).
     */
    @IBOutlet weak var invertedInterimColorDisplayLabel: UILabel?
    
    /* ################################################################## */
    /**
     This is a "label" for the RGB/HSL switch, that will set the switch to RGB.
     */
    @IBOutlet weak var rgbLabelButton: UIButton?
    
    /* ################################################################## */
    /**
     This is a "label" for the RGB/HSL switch, that will set the switch to HSL
     */
    @IBOutlet weak var hsbLabelButton: UIButton?
    
    /* ################################################################## */
    /**
     This switches the interim color mode between RGB and HSL.
     */
    @IBOutlet weak var hsbRGBSwitch: UISwitch?
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
        invertedLabel?.text = invertedLabel?.text?.localizedVariant
        rgbLabelButton?.setTitle(rgbLabelButton?.title(for: .normal)?.localizedVariant, for: .normal)
        hsbLabelButton?.setTitle(hsbLabelButton?.title(for: .normal)?.localizedVariant, for: .normal)
    }
    
    /* ################################################################## */
    /**
     Called when the view Hierarchy is laying out its subviews.
     */
    override func viewWillAppear(_ inIsAnimated: Bool) {
        super.viewWillAppear(inIsAnimated)
        color0TextEntry?.text = "FFFF0077"
        color1TextEntry?.text = "0000FFFF"
        interimColorSlider?.value = 0.5
        hsbRGBSwitch?.isOn = true
        colorTextEntryChanged()
    }
}

/* ###################################################################################################################################### */
// MARK: Callbacks
/* ###################################################################################################################################### */
extension RVS_UIKit_Toolbox_TestHarness_Tab4_ViewController {
    /* ################################################################## */
    /**
     Called when either of the Hex text field changes.
     
     - parameter: ignored (and can be omitted).
     */
    @IBAction func colorTextEntryChanged(_: Any! = nil) {
        guard let color0Hex = color0TextEntry?.text?.hexOnly,
              let color1Hex = color1TextEntry?.text?.hexOnly,
              let color0 = UIColor(hex: "#\(color0Hex)"),
              let color1 = UIColor(hex: "#\(color1Hex)")
        else { return }
        
        color0DisplayView?.backgroundColor = color0
        color1DisplayView?.backgroundColor = color1
        
        color0IsClearLabel?.text = "SLUG-CLEAR-LABEL-\(color0.isClear ? "YES" : "NO")".localizedVariant
        color1IsClearLabel?.text = "SLUG-CLEAR-LABEL-\(color1.isClear ? "YES" : "NO")".localizedVariant

        color0IsMonochromeLabel?.text = "SLUG-MONO-LABEL-\(color0.isMonochrome ? "YES" : "NO")".localizedVariant
        color1IsMonochromeLabel?.text = "SLUG-MONO-LABEL-\(color1.isMonochrome ? "YES" : "NO")".localizedVariant

        interimColorSlider?.minimumTrackTintColor = color0
        interimColorSlider?.maximumTrackTintColor = color1
        
        interimColorSliderChanged()
    }
    
    /* ################################################################## */
    /**
     Called when the interim color slider changes.
     
     - parameter: ignored (and can be omitted).
     */
    @IBAction func interimColorSliderChanged(_: Any! = nil) {
        var intermediateColor: UIColor = .clear
        
        guard let color0Hex = color0TextEntry?.text?.hexOnly,
              let color1Hex = color1TextEntry?.text?.hexOnly,
              let color0 = UIColor(hex: "#\(color0Hex)"),
              let color1 = UIColor(hex: "#\(color1Hex)"),
              let isHSL = hsbRGBSwitch?.isOn,
              let samplePoint = interimColorSlider?.value
        else {
            interimColorDisplayView?.backgroundColor = .clear
            interimColorDisplayLabel?.text = nil
            invertedInterimColorDisplayView?.backgroundColor = .clear
            invertedInterimColorDisplayLabel?.text = nil
            return
        }
        
        intermediateColor = color0.intermediateColor(otherColor: color1, samplePoint: CGFloat(samplePoint), isHSL: isHSL)
        
        var rgbaColorTuple = intermediateColor.rgba
        var hsbaColorTuple = intermediateColor.hsba
        var monoText = "SLUG-MONO-LABEL-\(intermediateColor.isMonochrome ? "YES" : "NO")".localizedVariant
        interimColorDisplayLabel?.font = .monospacedSystemFont(ofSize: 14, weight: .bold)
        interimColorDisplayLabel?.text = String(format: "SLUG-COLOR-DISPLAY-FORMAT".localizedVariant,
                                                        intermediateColor.hexValue,
                                                        rgbaColorTuple.r,
                                                        rgbaColorTuple.g,
                                                        rgbaColorTuple.b,
                                                        rgbaColorTuple.a,
                                                        hsbaColorTuple.h,
                                                        hsbaColorTuple.s,
                                                        hsbaColorTuple.b,
                                                        hsbaColorTuple.a,
                                                        monoText)
        
        interimColorDisplayView?.backgroundColor = intermediateColor

        intermediateColor = intermediateColor.inverted
        
        rgbaColorTuple = intermediateColor.rgba
        hsbaColorTuple = intermediateColor.hsba
        monoText = "SLUG-MONO-LABEL-\(intermediateColor.isMonochrome ? "YES" : "NO")".localizedVariant
        invertedInterimColorDisplayLabel?.font = .monospacedSystemFont(ofSize: 14, weight: .bold)
        invertedInterimColorDisplayLabel?.text = String(format: "SLUG-COLOR-DISPLAY-FORMAT".localizedVariant,
                                                                intermediateColor.hexValue,
                                                                rgbaColorTuple.r,
                                                                rgbaColorTuple.g,
                                                                rgbaColorTuple.b,
                                                                rgbaColorTuple.a,
                                                                hsbaColorTuple.h,
                                                                hsbaColorTuple.s,
                                                                hsbaColorTuple.b,
                                                                hsbaColorTuple.a,
                                                                monoText)
        invertedInterimColorDisplayView?.backgroundColor = intermediateColor
    }
    
    /* ################################################################## */
    /**
     Called then the RGB label button is hit.
     This forces the switch to RGB.
     
     - parameter: ignored (and can be omitted).
     */
    @IBAction func rgbLabelButtonHit(_: Any! = nil) {
        hsbRGBSwitch?.setOn(false, animated: true)
        hsbRGBSwitch?.sendActions(for: .valueChanged)
    }
    
    /* ################################################################## */
    /**
     Called when the RGB/HSL switch changes.
     
     - parameter: ignored (and can be omitted).
     */
    @IBAction func hsbRGBButtonHit(_: Any! = nil) {
        rgbLabelButton?.isEnabled = hsbRGBSwitch?.isOn ?? false
        hsbLabelButton?.isEnabled = !(hsbRGBSwitch?.isOn ?? true)
        interimColorSliderChanged()
    }
    
    /* ################################################################## */
    /**
     Called then the HSL label button is hit.
     This forces the switch to HSL.
     
     - parameter: ignored (and can be omitted).
     */
    @IBAction func hsbLabelButtonHit(_: Any! = nil) {
        hsbRGBSwitch?.setOn(true, animated: true)
        hsbRGBSwitch?.sendActions(for: .valueChanged)
    }
}
