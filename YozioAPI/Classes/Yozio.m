//
//  Yozio.m
//  YozioAPI
//
//  Created by Francis Chong on 12年9月10日.
//  Copyright (c) 2012年 Ignition Soft. All rights reserved.
//

#import "Yozio.h"
#import "ASIHTTPRequest.h"
#import "Reachability.h"

#define kYozioTrackedKey @"yozio.tracked"

@implementation Yozio

+(void) trackInstallWithAppKey:(NSString*)key {
    if ([Yozio isTracked]) {
        return;
    }
    
    if (![Reachability reachabilityWithHostname:@"yoz.io"]){
        NSLog(@"[Yozio] yoz.io not reachable!");
        return;
    }

    NSLog(@"[Yozio] Initialize install tracking ...");
    NSString *deviceName = [[[UIDevice currentDevice] name] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *url = [NSString stringWithFormat:@"http://yoz.io/e?app_key=%@&device_name=%@", key, deviceName];

    ASIHTTPRequest* req = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [req setNumberOfTimesToRetryOnTimeout:2];
    [req setCompletionBlock:^{
        NSLog(@"[Yozio] Completed install tracking");
        NSUserDefaults* setting = [NSUserDefaults standardUserDefaults];
        [setting setBool:YES forKey:kYozioTrackedKey];
        [setting synchronize];
    }];
    [req startAsynchronous];
}

+(BOOL) isTracked {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kYozioTrackedKey];
}

@end