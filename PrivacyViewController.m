//
//  PrivacyViewController.m
//  ESRB
//
//  Created by David Shalamberidze on 5/3/13.
//  Copyright (c) 2013 Entertainment Software Rating Board. All rights reserved.
//

#import "PrivacyViewController.h"
#import "AboutWebViewController.h"

#define COLLAPSED_VIEW_HEIGHT_PHONE 33
#define COLLAPSED_VIEW_HEIGHT_PAD 48

#define VIEW1_HEIGHT_PHONE 140
#define VIEW2_HEIGHT_PHONE 102
#define VIEW3_HEIGHT_PHONE 122
#define VIEW4_HEIGHT_PHONE 157

#define VIEW1_HEIGHT_PAD 176
#define VIEW2_HEIGHT_PAD 132
#define VIEW3_HEIGHT_PAD 128
#define VIEW4_HEIGHT_PAD 192

@interface PrivacyViewController () {
    NSInteger collapsedViewHeight;
    NSInteger view1Height;
    NSInteger view2Height;
    NSInteger view3Height;
    NSInteger view4Height;
}

@property (retain, nonatomic) IBOutlet UIView *view1;
@property (retain, nonatomic) IBOutlet UIView *view2;
@property (retain, nonatomic) IBOutlet UIView *view3;
@property (retain, nonatomic) IBOutlet UIView *view4;
@property (retain, nonatomic) IBOutlet UIView *view5;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UIImageView *plus1;
@property (retain, nonatomic) IBOutlet UIImageView *minus1;
@property (retain, nonatomic) IBOutlet UIImageView *plus2;
@property (retain, nonatomic) IBOutlet UIImageView *minus2;
@property (retain, nonatomic) IBOutlet UIImageView *plus3;
@property (retain, nonatomic) IBOutlet UIImageView *minus3;
@property (retain, nonatomic) IBOutlet UIImageView *plus4;
@property (retain, nonatomic) IBOutlet UIImageView *minus4;
@end

@implementation PrivacyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            collapsedViewHeight = COLLAPSED_VIEW_HEIGHT_PHONE;
            view1Height = VIEW1_HEIGHT_PHONE;
            view2Height = VIEW2_HEIGHT_PHONE;
            view3Height = VIEW3_HEIGHT_PHONE;
            view4Height = VIEW4_HEIGHT_PHONE;
        } else {
            collapsedViewHeight = COLLAPSED_VIEW_HEIGHT_PAD;
            view1Height = VIEW1_HEIGHT_PAD;
            view2Height = VIEW2_HEIGHT_PAD;
            view3Height = VIEW3_HEIGHT_PAD;
            view4Height = VIEW4_HEIGHT_PAD;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateScrollView
{
    CGRect f5 = self.view5.frame;
    CGSize size = self.scrollView.contentSize;
    size.height = f5.origin.y + f5.size.height;
    self.scrollView.contentSize = size;
}

- (IBAction)backPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)button1Pressed:(id)sender
{
    CGRect f1 = self.view1.frame;
    CGRect f2 = self.view2.frame;
    CGRect f3 = self.view3.frame;
    CGRect f4 = self.view4.frame;
    CGRect f5 = self.view5.frame;
    
    int delta = view1Height - collapsedViewHeight;
    if (f1.size.height == collapsedViewHeight) {
        f1.size.height = view1Height;
        self.plus1.hidden = YES;
        self.minus1.hidden = NO;
    } else {
        f1.size.height = collapsedViewHeight;
        delta = -delta;
        self.plus1.hidden = NO;
        self.minus1.hidden = YES;
    }
    f2.origin.y += delta;
    f3.origin.y += delta;
    f4.origin.y += delta;
    f5.origin.y += delta;
    [UIView animateWithDuration:0.12
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.view1.frame = f1;
                         self.view2.frame = f2;
                         self.view3.frame = f3;
                         self.view4.frame = f4;
                         self.view5.frame = f5;
                     }
                     completion:^(BOOL finished) {
                         [self updateScrollView];
                     }];
}

- (IBAction)button2Pressed:(id)sender
{
    CGRect f2 = self.view2.frame;
    CGRect f3 = self.view3.frame;
    CGRect f4 = self.view4.frame;
    CGRect f5 = self.view5.frame;
    
    int delta = view2Height - collapsedViewHeight;
    if (f2.size.height == collapsedViewHeight) {
        f2.size.height = view2Height;
        self.plus2.hidden = YES;
        self.minus2.hidden = NO;
    } else {
        f2.size.height = collapsedViewHeight;
        delta = -delta;
        self.plus2.hidden = NO;
        self.minus2.hidden = YES;
    }
    f3.origin.y += delta;
    f4.origin.y += delta;
    f5.origin.y += delta;
    [UIView animateWithDuration:0.12
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.view2.frame = f2;
                         self.view3.frame = f3;
                         self.view4.frame = f4;
                         self.view5.frame = f5;
                     }
                     completion:^(BOOL finished) {
                         [self updateScrollView];
                     }];
}

- (IBAction)button3Pressed:(id)sender
{
    CGRect f3 = self.view3.frame;
    CGRect f4 = self.view4.frame;
    CGRect f5 = self.view5.frame;
    
    int delta = view3Height - collapsedViewHeight;
    if (f3.size.height == collapsedViewHeight) {
        f3.size.height = view3Height;
        self.plus3.hidden = YES;
        self.minus3.hidden = NO;
    } else {
        f3.size.height = collapsedViewHeight;
        delta = -delta;
        self.plus3.hidden = NO;
        self.minus3.hidden = YES;
    }
    f4.origin.y += delta;
    f5.origin.y += delta;
    [UIView animateWithDuration:0.12
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.view3.frame = f3;
                         self.view4.frame = f4;
                         self.view5.frame = f5;
                     }
                     completion:^(BOOL finished) {
                         [self updateScrollView];
                     }];
}

- (IBAction)button4Pressed:(id)sender
{
    CGRect f4 = self.view4.frame;
    CGRect f5 = self.view5.frame;
    
    int delta = view4Height - collapsedViewHeight;
    if (f4.size.height == collapsedViewHeight) {
        f4.size.height = view4Height;
        self.plus4.hidden = YES;
        self.minus4.hidden = NO;
    } else {
        f4.size.height = collapsedViewHeight;
        delta = -delta;
        self.plus4.hidden = NO;
        self.minus4.hidden = YES;
    }
    f5.origin.y += delta;
    [UIView animateWithDuration:0.12
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.view4.frame = f4;
                         self.view5.frame = f5;
                     }
                     completion:^(BOOL finished) {
                         [self updateScrollView];
                     }];
}

- (IBAction)button5Pressed:(id)sender {
    AboutWebViewController *vc = [[[AboutWebViewController alloc] initWithNibName:@"AboutWebViewController" bundle:nil] autorelease];
    vc.titleText = @"Mobile Privacy Policy";
    vc.htmlFile = @"privacy";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)more1Pressed:(id)sender {
    AboutWebViewController *vc = [[[AboutWebViewController alloc] initWithNibName:@"AboutWebViewController" bundle:nil] autorelease];
    vc.titleText = @"Mobile Privacy Policy";
    vc.htmlFile = @"privacy";
    vc.anchor = @"q1";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)more2Pressed:(id)sender {
    AboutWebViewController *vc = [[[AboutWebViewController alloc] initWithNibName:@"AboutWebViewController" bundle:nil] autorelease];
    vc.titleText = @"Mobile Privacy Policy";
    vc.htmlFile = @"privacy";
    vc.anchor = @"q2";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)more3Pressed:(id)sender {
    AboutWebViewController *vc = [[[AboutWebViewController alloc] initWithNibName:@"AboutWebViewController" bundle:nil] autorelease];
    vc.titleText = @"Mobile Privacy Policy";
    vc.htmlFile = @"privacy";
    vc.anchor = @"q3";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)more4Pressed:(id)sender {
    AboutWebViewController *vc = [[[AboutWebViewController alloc] initWithNibName:@"AboutWebViewController" bundle:nil] autorelease];
    vc.titleText = @"Mobile Privacy Policy";
    vc.htmlFile = @"privacy";
    vc.anchor = @"q4";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)emailPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:privacy@esrb.org?subject=General%20Privacy%20Policy%20Question"]];
}

- (void)dealloc {
    [_view1 release];
    [_view2 release];
    [_view3 release];
    [_view4 release];
    [_view5 release];
    [_scrollView release];
    [_plus1 release];
    [_minus1 release];
    [_plus2 release];
    [_minus2 release];
    [_plus3 release];
    [_minus3 release];
    [_plus4 release];
    [_minus4 release];
    [super dealloc];
}
@end
