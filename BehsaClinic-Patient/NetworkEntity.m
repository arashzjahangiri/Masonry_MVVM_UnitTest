//
//  NetworkEntity.m
//  NewProject
//
//  Created by Arash on 16/5/11.
//  Copyright © 2016 Arash. All rights reserved.
//

#import "NetworkEntity.h"

@implementation NetworkEntity

+ (void)getDiscorverListWithsuccess:(NetworkingSuccessBlock)successBlock
                            failure:(NetworkingFailureBlock)failureBlock
                           callBack:(NetworkingCallBackBlock)callBackBlock
{
    
    NSDictionary *params = @{
                             @"id": @""
                             };
    [Networking postWithPath:@""
                    parameters:params
                       success:successBlock
                       failure:failureBlock
                      callBack:callBackBlock];

}


+ (void)getRadioListWithRadioID:(NSString *)radioID
                          start:(NSInteger)start
                          limit:(NSInteger)limit
                      success:(NetworkingSuccessBlock)successBlock
                      failure:(NetworkingFailureBlock)failureBlock
                     callBack:(NetworkingCallBackBlock)callBackBlock
{
    NSDictionary *params = @{ @"start": @(start),
                              @"limit": @(limit),
                              @"radioid": radioID,
                              @"client": @2 };
    [Networking postWithPath:@""
                    parameters:params
                       success:successBlock
                       failure:failureBlock
                      callBack:callBackBlock];
}

+ (void)getRadioPlayerTingID:(NSString *)tingID
                      success:(NetworkingSuccessBlock)successBlock
                      failure:(NetworkingFailureBlock)failureBlock
                     callBack:(NetworkingCallBackBlock)callBackBlock
{
    if (!tingID.length) {
        return;
    }
    NSDictionary *params = @{
                             @"id": tingID
                             };
    [Networking postWithPath:@""
                    parameters:params success:successBlock
                       failure:failureBlock
                      callBack:callBackBlock];
    
}

@end
