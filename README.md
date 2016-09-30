# DJHUD

A simple swift HUD framework.It is refer to a github project named [PKHUD](https://github.com/pkluz/PKHUD)

###Usage

Default type is Success.
	
	HUD.flash() 
	or
	HUD.flash(.Success)
	
And it is also very simple for you to use the view single, for example:

If you have a variable is a DJActivityIndicatorType type, and then:
	
	let type: DJActivityIndicatorType = .NineDots
	let view = type.contentView

###Integrate
Now it is support pod, and very easy for you to integrate this framework to your project like this way:
	
Use pod:
	
	source 'https://github.com/CocoaPods/Specs.git'
	platform :ios, '9.0'
	use_frameworks!

	target 'Your project name' do

	pod 'DJHUD', '~> 1.1.3'

	end
	
###Type
It has ten types of activity indicator, there are type names:

	case Success
    case Error
    case Progress
    
    // ActivityIndicatorType
    case NineDots
    case TriplePulse
    case FiveDots
    case RotatingSquare
    case DoubleBounce
    case BallPulse
    case BallRotateClip
    case BallClipRotatePulse
    case BallRotateMultiple
    case BallRotate
    case BallTriaglePath
    case BallScale
    case LineScale
    case LineScaleParty
    case BallScaleMultiple
	
### ScreenShot

<img src="https://github.com/dyljqq/DJHUD/raw/master/ScreenShot/1.png" width="187.5" height="337.5"/> 
<img src="https://github.com/dyljqq/DJHUD/raw/master/ScreenShot/2.png" width="187.5" height="337.5"/>