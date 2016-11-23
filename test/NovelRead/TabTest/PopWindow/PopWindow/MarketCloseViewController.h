//
//  MarketCloseViewController.h
//  PopWindow
//
//  Created by hxl on 2016/11/23.
//  Copyright © 2016年 com.hxl.ctp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarketCloseViewController : UIViewController
-(void) presentTransparentModalViewController: (UIViewController *) aViewController

                                     animated: (BOOL) isAnimated

                                    withAlpha: (CGFloat) anAlpha;
-(void) dismissTransparentModalViewControllerAnimated:(BOOL) animated;
@end
