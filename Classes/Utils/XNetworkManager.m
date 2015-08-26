//
//  XNetworkManager.m
//  XToolsDemo
//
//  Created by dev on 15/8/20.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XNetworkManager.h"
#import "AFNetworking.h"


@implementation XNetworkManager

- (void)getJsonRequestWithUrlString:(NSString *)urlString responseBlock:(responseBlock)block {
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        id dict = [NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        block(YES, dict);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        block(NO, nil);
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

- (void)getRequestWithUrlString:(NSString *)urlString param:(id)param responseBlock:(responseBlock)block {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    //申明返回的结果是json类型
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    //申明请求的数据是json类型
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //传入的参数
    NSDictionary *parameters = param ? param : @{};
    //发送请求
    [manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        id dict = [NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        block(YES, dict);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        block(NO, nil);
    }];

}


- (void)postRequestWithUrlString:(NSString *)urlString param:(id)param responseBlock:(responseBlock)block {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //传入的参数
    NSDictionary *parameters = param ? param : @{};
    //发送请求
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        id dict = [NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        block(YES, dict);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        block(NO, nil);
    }];

}

@end
