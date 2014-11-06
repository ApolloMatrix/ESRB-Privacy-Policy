//
//  AboutWebViewController.m
//  ESRB
//
//  Created by David Shalamberidze on 2/6/13.
//  Copyright (c) 2013 Entertainment Software Rating Board. All rights reserved.
//

#import "AboutWebViewController.h"

@interface AboutWebViewController ()

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation AboutWebViewController

@synthesize webView;
@synthesize titleLabel;
@synthesize htmlFile;
@synthesize titleText;
@synthesize anchor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    titleLabel.text = titleText;
    
    webView.delegate = self;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:htmlFile ofType:@"html" inDirectory:@""];
    NSURL *baseUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES];

    [webView loadData:[NSData dataWithContentsOfFile:path] MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseUrl];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([[[request URL] scheme] isEqual:@"mailto"] || [[[request URL] scheme] isEqual:@"http"] || [[[request URL] scheme] isEqual:@"https"]) {
        [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (self.anchor) {
        [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.location.hash='%@';", anchor]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    self.webView = nil;
    self.titleLabel = nil;
    
    self.htmlFile = nil;
    self.titleText = nil;
    self.anchor = nil;
    
    [super dealloc];
}
@end
