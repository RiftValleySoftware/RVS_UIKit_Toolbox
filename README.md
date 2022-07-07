![Icon](img/icon.png)

# ``RVS_UIKit_Toolbox``

A set of basic [UIKit](https://developer.apple.com/documentation/uikit) tools, for Swift iOS app development.

## Overview

This package offers a few extensions of standard UIKit classes, in order to abstract some of the more common sftware tasks.

## Implementation

### Where to Get

- [The project is available at this GitHub repo](https://github.com/RiftValleySoftware/RVS_UIKit_Toolbox)
- [Here is the technical documentation](https://riftvalleysoftware.github.io/RVS_UIKit_Toolbox/)

#### Swift Package Manager

The most common method of integration will almost certainly be via [the Swift Package Manager (SPM)](https://www.swift.org/package-manager/).

The package can be accessed from [GitHub](https://github.com), via the following URIs:

- SSL: git@github.com:RiftValleySoftware/RVS_UIKit_Toolbox.git
- HTTPS: https://github.com/RiftValleySoftware/RVS_UIKit_Toolbox.git

Simply integrate the package into your project, and import the module, in files that use its extensions:

    import RVS_UIKit_Toolbox

#### Carthage

You can also get the package, using [Carthage](https://github.com/Carthage/Carthage), the general-purpose package manager that is supplied by GitHub.

In order to import the package, add the following line to your [cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile):

    github "RiftValleySoftware/RVS_UIKit_Toolbox"

If you choose to build the module, you will also need to import the module into files that use the extensions:

    import RVS_UIKit_Toolbox
    
Alternatively, the entire set of extensions is available in [a single source file](https://github.com/RiftValleySoftware/RVS_UIKit_Toolbox/blob/master/Sources/RVS_UIKit_Toolbox/RVS_UIKit_Toolbox.swift), that you can integrate directly into the main module:

With Carthage, this would be available in the `Carthage/Checkins/RVS_UIKit_ToolboxSources/RVS_UIKit_Toolbox` directory.

If you do this, then the file would be integrated directly into the main module, so you will not need to `import` the file.

#### Git Submodule

Finally, you can simply include the module into your project, using [a Git Submodule](), which is available, using the two URIs (SSL or HTTPS), referenced above, in Swift Package Manager section.

If you do this, you should include the source file directly into your project, as outlined in the Carthage section.

### How to Use

Once the package has been added to the project, and the module is imported (or the source file is directly integrated into the main module), the extensions immediately become available in the base UIKit classes. The extensions are listed below:

#### [UITabBarController](https://riftvalleysoftware.github.io/RVS_UIKit_Toolbox/Extensions/UITabBarController.html)

This adds just one method to [the standard UIKit UITabBarController Class](https://developer.apple.com/documentation/uikit/uitabbarcontroller):

- [`setColorsTo(normal: UIColor?, selected: UIColor?, background: UIColor?)`](https://riftvalleysoftware.github.io/RVS_UIKit_Toolbox/Extensions/UITabBarController.html#/s:So18UITabBarControllerC17RVS_UIKit_ToolboxE11setColorsTo6normal8selected10backgroundySo7UIColorCSg_A2JtF)

The purpose of this method, is to allow an easy shortcut to customizing the colors of the Tab Bar.

# LICENSE

© Copyright 2022, [The Great Rift Valley Software Company](https://riftvalleysoftware.com)

[MIT License](https://opensource.org/licenses/MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
