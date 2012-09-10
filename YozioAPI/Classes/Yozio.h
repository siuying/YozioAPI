//
//  Yozio.h
//  YozioAPI
//
//  Created by Francis Chong on 12年9月10日.
//  Copyright (c) 2012年 Ignition Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Yozio : NSObject

// Track installation with supplied app key, if this device has not been tracked
+(void) trackInstallWithAppKey:(NSString*)key;

// If this device has been tracked
+(BOOL) isTracked;

@end
