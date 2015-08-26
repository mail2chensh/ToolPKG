//
//  XNetworkManager.h
//  XToolsDemo
//
//  Created by dev on 15/8/20.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^responseBlock)(BOOL success, id Dict);

@interface XNetworkManager : NSObject

- (void)getJsonRequestWithUrlString:(NSString *)urlString responseBlock:(responseBlock)block;

- (void)getRequestWithUrlString:(NSString *)urlString param:(id)param responseBlock:(responseBlock)block;

- (void)postRequestWithUrlString:(NSString *)urlString param:(id)param responseBlock:(responseBlock)block;

@end
