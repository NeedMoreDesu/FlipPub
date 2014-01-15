/*
 This module is licensed under the MIT license.
 
 Copyright (C) 2011 by raw engineering
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */
//
//  FlipPubAppDelegate.m
//  FlipPub
//
//  Created by Reefaq Mohammed on 16/07/11.
 
//

#import "FlipPubAppDelegate.h"
#import "WallViewController.h"
#import "EPubViewController.h"


@implementation FlipPubAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize epubViewController;

+ (FlipPubAppDelegate *) instance {
	return (FlipPubAppDelegate *) [[UIApplication sharedApplication] delegate];
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    NSLog(@"%@", [[NSBundle mainBundle] pathForResource:@"book" ofType:@"epub"]);
    [self.epubViewController loadEpub:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"book" ofType:@"epub"]]];

    // Override point for customization after app launch.
	viewController = [[WallViewController alloc] initWithNibName:nil bundle:nil];
	
    [self.window setRootViewController:viewController];
    [self.window makeKeyAndVisible];
    
//    self.window.rootViewController = self.epubViewController;
//    [self.window makeKeyAndVisible];

//    int targetSpineIndex = arc4random() % self.epubViewController.loadedEpub.spineArray.count;
//    NSLog(@"%@", [self.epubViewController.loadedEpub.spineArray[targetSpineIndex] title]);
//
//    double delayInSeconds = 6.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        [epubViewController loadSpine:targetSpineIndex atPageIndex:1 highlightSearchResult:nil];
//    });

	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

-(void)showViewInFullScreen:(UIViewExtention*)viewToShow withModel:(MessageModel*)model{
	[viewController showViewInFullScreen:viewToShow withModel:model];
}
-(void)closeFullScreen {
	[viewController closeFullScreen];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [epubViewController release];
    [window release];
    [super dealloc];
}


@end
