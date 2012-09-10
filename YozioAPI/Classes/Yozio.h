//
//  Yozio.h
//  YozioAPI
//
//  Created by Francis Chong on 12年9月10日.
//  Copyright (c) 2012年 Ignition Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Yozio : NSObject

+(void) trackInstallWithAppKey:(NSString*)key;

+(BOOL) isTracked;

@end
