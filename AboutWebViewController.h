//
//  AboutWebViewController.h
//  ESRB
//
//  Created by David Shalamberidze on 2/6/13.
//  Copyright (c) 2013 Entertainment Software Rating Board. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutWebViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, retain) NSString *htmlFile;
@property (nonatomic, retain) NSString *titleText;
@property (nonatomic, retain) NSString *anchor;

@end
