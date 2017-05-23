# PresentationControllerExperiment

This is a sample Xcode project that crashes when the button "Present View Controller" is tapped. The question is: Why?

The issues seems to be that UIKit cannot create the connections for the outlet set in `DimmedPresentationView.xib`:

    Terminating app due to uncaught exception 'NSUnknownKeyException', 
    reason: '[<_SwiftValue 0x610000052780> setValue:forUndefinedKey:]: 
    this class is not key value coding-compliant for the key closeButton.'

When you remove the outlet for the `closeButton` to the File's Owner in `DimmedPresentationView.xib` the app runs as expected without a crash. **So why can the outlet connection not be established?**

## Related question on Stackoverflow:

https://stackoverflow.com/q/44132407/2062785
