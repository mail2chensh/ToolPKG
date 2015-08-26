//
//  XTimerManager.m
//  startWild
//
//  Created by dev on 15/7/31.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XTimerManager.h"

@interface XTimerManager ()
{
    
}

@property (nonatomic, strong) NSMutableDictionary *timerDict;

@end



static XTimerManager *_instance = nil;

@implementation XTimerManager

+ (XTimerManager *)shareManager
{
    if (_instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[XTimerManager alloc] init];
            _instance.timerDict = [NSMutableDictionary dictionary];
        });
    }
    return _instance;
}

- (NSTimer *)timerWithTimerName:(NSString *)timerName
{
    NSTimer *timer = [self.timerDict objectForKey:timerName];
    return timer;
}


- (NSTimer *)timerWithTimerName:(NSString *)timerName timeInterval:(NSTimeInterval)timeInterval target:(id)target selector:(SEL)selector repeats:(BOOL)repeats
{
    NSTimer *timer = [self.timerDict objectForKey:timerName];
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:target selector:selector userInfo:nil repeats:repeats];
        [self.timerDict setObject:timer forKey:timerName];
    }
    return timer;
}


@end
