# RatePopup

Component to rate/give feedbak. It is made with Swift language. Just need to download RatePopup.swift and RateApp.xib and set them into your project.

![Captura de pantalla 2019-09-03 a las 15 11 14](https://user-images.githubusercontent.com/16594147/64181466-651a9780-ce5e-11e9-8c11-5dd26f048435.png)
![Captura de pantalla 2019-09-03 a las 15 11 18](https://user-images.githubusercontent.com/16594147/64181468-65b32e00-ce5e-11e9-8168-28466dec028b.png)

# USAGE

<h3>First steps:</h3>

<h4>Import RatePopup on your ViewController:</h4>

First you need to create a Bridge header file and then import it into your ViewController. Example:

* Objective-C:
```Objective-C
import "BridgeHeader-Swift.h"
```

<h4>Reference RatePopupDelegate on ViewController:</h4>

* Objective-C:
```Objective-C
@interface MyController : ViewController <RatePopupDelegate>
```

* Swift:
```Swift
class MyViewController: UIViewController, RatePopupDelegate {
```

<h4>Instantiate RatePopup:</h4>

* Objective-C:
```Objective-C
RatePopup *ratePopup = [[RatePopup alloc] init];
```

* Swift:
```Swift
let ratePopup = RatePopup()
```

<h4>Set delegate:</h4>

* Objective-C and Swift:
```Swift
ratePopup.ratePopupDelegate = self
```

<h4>Present RateApp on my ViewController:</h4>

* Objective-C:
```Objective-C
[self presentViewController:ratePopup animated:NO completion:nil];
```

* Swift:
```Swift
self.present(ratePopup, animated: false, completion: nil)
```

### Elements configurations:

<h4>Set message:</h4>

* Objective-C:
```Objective-C
[ratePopup setMessage:@"Message you want"];
```

* Swift:
```Swift
ratePopup.setMessage("How do you value our service?")
```

<h4>Set message color:</h4>

* Objective-C:
```Objective-C
[ratePopup setMessageColorText:[UIColor blueColor]];
```

* Swift:
```Swift
ratePopup.setMessageColorText(UIColor.green)
```

<h4>Set more details textfield placeholder:</h4>

* Objective-C:
```Objective-C
[ratePopup setMoreDetailsPlaceHolder:@"Add more details"];
```

* Swift:
```Swift
ratePopup.setMoreDetailsPlaceHolder("Add more details")
```

<h4>If you want to change title of buttons:</h4>

* Objective-C:
```Objective-C
[ratePopup setOkButtonTitle:@"Ok title"];
[ratePopup setCancelButtonTitle:@"Cancel title"];
```

* Swift:
```Swift
ratePopup.setOkButtonTitle("Ok Title")
ratePopup.setCancelButtonTitle("Cancel Title")
```

<h4>If you want to change color of text of buttons:</h4>

* Objective-C:
```Objective-C
[ratePopup setOkButtonTitleColor:[UIColor greenColor]];
[ratePopup setCancelButtonTitleColor:[UIColor greenColor]];
```

* Swift:
```Swift
ratePopup.setOkButtonTitleColor(UIColor.green)
ratePopup.setCancelButtonTitleColor(UIColor.green)
```

<h4>If you want to change color of stars:</h4>

* Objective-C:
```Objective-C
[ratePopup setStarsColor:[UIColor redColor]];
```

* Swift:
```Swift
ratePopup.setStarsColor(UIColor.green)
```

<h4>Function to call when click on OK Button:</h4>

You need to set it on your ViewController:

* Objective-C:
```Objective-C
- (void)onClickRatePopupOKWithScore:(NSInteger)score comments:(NSString *)comments {
	//Do whatever you want when you click on OK button. Score is how many stars user sets as score and comment is what user	sets on "More Details" TextField:
    NSLog(@"Score: %ld", score);
}
```

* Swift:
```Swift
func onClickRatePopupOK(score: Int, comments: String) {
 	//Do whatever you want when you click on OK button. Score is how many stars user sets as score and comment is what user	sets on "More Details" TextField:
    }
```

<h4>Function to call when click on CANCEL button. You need to set it on your ViewController:</h4>

* Objective-C:
```Objective-C
(void)onClickRateAppCancel {
    //Do whatever you want when you click on Cancel button.
}
```

* Swift:
```Swift
func onClickRatePopupCancel() {
	//Do whatever you want when you click on Cancel button.
}
```
