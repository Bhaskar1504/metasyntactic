// Copyright 2008 Cyrus Najmabadi
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "WebViewController.h"

#import "AbstractApplication.h"
#import "AlertUtilities.h"
#import "MetasyntacticSharedApplication.h"
#import "NotificationCenter.h"
#import "ViewControllerUtilities.h"

#define NAVIGATE_BACK_ITEM 1
#define NAVIGATE_FORWARD_ITEM 3

@interface WebViewController()
@property (retain) UIWebView* webView;
@property (retain) UIActivityIndicatorView* activityView;
@property (retain) UILabel* label;
@property (copy) NSString* address;
@property BOOL showSafariButton;
@property BOOL errorReported;
#ifndef IPHONE_OS_VERSION_3
@property (retain) UIToolbar* toolbar;
#endif
@end


@implementation WebViewController

@synthesize webView;
@synthesize activityView;
@synthesize label;
@synthesize address;
@synthesize showSafariButton;
@synthesize errorReported;
#ifndef IPHONE_OS_VERSION_3
@synthesize toolbar;
#endif

- (void) dealloc {
    self.webView = nil;
    self.activityView = nil;
    self.label = nil;
    self.address = nil;
    self.showSafariButton = NO;
    self.errorReported = NO;
#ifndef IPHONE_OS_VERSION_3
    self.toolbar = nil;
#endif

    [super dealloc];
}


- (id) initWithAddress:(NSString*) address__
      showSafariButton:(BOOL) showSafariButton__ {
    if ((self = [super init])) {
        self.address = address__;
        self.showSafariButton = showSafariButton__;
    }

    return self;
}


- (void) setupTitleView {
    self.activityView = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] autorelease];
    [activityView startAnimating];

    CGRect frame = activityView.frame;
    frame.origin.y += 2;
    activityView.frame = frame;

    self.label = [ViewControllerUtilities viewControllerTitleLabel];
    label.text = LocalizedString(@"Loading", nil);
    [label sizeToFit];

    frame = label.frame;
    frame.origin.x += (activityView.frame.size.width + 5);
    label.frame = frame;

    frame = CGRectMake(0, 0, label.frame.size.width + activityView.frame.size.width + 5, label.frame.size.height);
    UIView* view = [[[UIView alloc] initWithFrame:frame] autorelease];
    [view addSubview:activityView];
    [view addSubview:label];

    self.navigationItem.titleView = view;
}


- (void) setupWebView {
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    self.webView = [[[UIWebView alloc] initWithFrame:frame] autorelease];
    webView.delegate = self;
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    webView.scalesPageToFit = YES;

    [self.view addSubview:webView];
}


- (void) setupToolbarItems {
    NSMutableArray* items = [NSMutableArray array];

    [items addObject:[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease]];

    UIBarButtonItem* navigateBackItem = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Navigate-Back.png"]
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self
                                                                         action:@selector(onNavigateBackTapped:)] autorelease];
    [items addObject:navigateBackItem];

    [items addObject:[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease]];

    UIBarButtonItem* navigateForwardItem = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Navigate-Forward.png"]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onNavigateForwardTapped:)] autorelease];
    [items addObject:navigateForwardItem];

    [items addObject:[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease]];

#ifdef IPHONE_OS_VERSION_3
    [self setToolbarItems:items animated:NO];
#else
    [toolbar setItems:items animated:NO];
#endif
}


- (void) setupToolbar {
#ifndef IPHONE_OS_VERSION_3
    CGRect webframe = self.view.frame;
    webframe.origin.x = 0;
    webframe.origin.y = 0;

    CGRect toolbarFrame;
    CGRectDivide(webframe, &toolbarFrame, &webframe, 42, CGRectMaxYEdge);

    self.toolbar = [[[UIToolbar alloc] initWithFrame:toolbarFrame] autorelease];
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    toolbar.barStyle = UIBarStyleBlackTranslucent;

    [self.view addSubview:toolbar];
    [self.view bringSubviewToFront:toolbar];
#endif
}


- (void) loadView {
    [super loadView];

    [self setupWebView];
    [self setupToolbar];

    if (showSafariButton) {
        self.navigationItem.rightBarButtonItem =
        [[[UIBarButtonItem alloc] initWithTitle:LocalizedString(@"Safari", nil)
                                          style:UIBarButtonItemStyleDone
                                         target:self
                                         action:@selector(open:)] autorelease];
    }

    [self setupTitleView];
    [self setupToolbarItems];

    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:address]]];
}


- (void) open:(id) sender {
    NSString* url = webView.request.URL.absoluteString;
    if (url.length == 0) {
        url = address;
    }

    [AbstractApplication openBrowser:url];
}


- (void) clearTitle {
    [UIView beginAnimations:nil context:NULL];
    {
        label.alpha = 0;
        activityView.alpha = 0;
    }
    [UIView commitAnimations];
}


- (void) updateToolBarItems {
#ifdef IPHONE_OS_VERSION_3
    UIBarButtonItem* navigateBackItem = [self.navigationController.toolbar.items objectAtIndex:NAVIGATE_BACK_ITEM];
    UIBarButtonItem* navigateForwardItem = [self.navigationController.toolbar.items objectAtIndex:NAVIGATE_FORWARD_ITEM];
#else
    UIBarButtonItem* navigateBackItem = [toolbar.items objectAtIndex:NAVIGATE_BACK_ITEM];
    UIBarButtonItem* navigateForwardItem = [toolbar.items objectAtIndex:NAVIGATE_FORWARD_ITEM];
#endif

    navigateBackItem.enabled = webView.canGoBack;
    navigateForwardItem.enabled = webView.canGoForward;

    //BOOL hidden = !navigateBackItem.enabled && !navigateForwardItem.enabled;
}


- (void) onNavigateBackTapped:(id) sender {
    if (webView.canGoBack) {
        [webView goBack];
    }

    [self updateToolBarItems];
}


- (void) onNavigateForwardTapped:(id) sender {
    if (webView.canGoForward) {
        [webView goForward];
    }

    [self updateToolBarItems];
}


- (void) webViewDidFinishLoad:(UIWebView*) webView_ {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(clearTitle) object:nil];
    [self performSelector:@selector(clearTitle) withObject:nil afterDelay:4];

    [self updateToolBarItems];
}


- (void) webView:(UIWebView*) view didFailLoadWithError:(NSError*) error {
    [self webViewDidFinishLoad:view];

    if (errorReported) {
        return;
    }

    if (error.domain == NSURLErrorDomain && error.code == -1009) {
        NSString* title = LocalizedString(@"Cannot Open Page", nil);
        NSString* message =
        [NSString stringWithFormat:LocalizedString(@"%@ cannot open the page because it is not connected to the Internet.", nil), [AbstractApplication name]];

        [AlertUtilities showOkAlert:message withTitle:title];
        self.errorReported = YES;
    }
}


- (void) webViewDidStartLoad:(UIWebView*) webView {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(clearTitle) object:nil];

    label.alpha = 1;
    activityView.alpha = 1;

    [self updateToolBarItems];
}


- (void) viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
#ifdef IPHONE_OS_VERSION_3
    self.navigationController.toolbar.barStyle = UIBarStyleBlack;
    self.navigationController.toolbar.translucent = YES;
    [self.abstractNavigationController setToolbarHidden:NO animated:NO];
#endif
}


- (void) viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    webView.delegate = nil;
#ifdef IPHONE_OS_VERSION_3
    [self.abstractNavigationController setToolbarHidden:YES animated:NO];
#endif
}


- (void) setAllowsAnyHTTPSCertificate:(BOOL) allows forHost:(NSString*) host {
}


- (BOOL)                 webView:(UIWebView*) webView
      shouldStartLoadWithRequest:(NSURLRequest*) request
                  navigationType:(UIWebViewNavigationType) navigationType {
    if ([[NSURLRequest class] respondsToSelector:@selector(setAllowsAnyHTTPSCertificate:forHost:)]) {
        [(id)[NSURLRequest class] setAllowsAnyHTTPSCertificate:YES forHost:request.URL.host];
    }

    if ([request.URL.absoluteString hasPrefix:@"nowplaying://popviewcontroller"]) {
        [self.abstractNavigationController popViewControllerAnimated:YES];
        return NO;
    }

    return YES;
}

@end