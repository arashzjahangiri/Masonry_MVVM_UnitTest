//
//  NetworkEntity.h
//  NewProject
//
//  Created by Arash on 16/5/11.
//  Copyright © 2016 Arash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkEntity : NSObject

+ (void)getDiscorverListWithsuccess:(NetworkingSuccessBlock)successBlock
        failure:(NetworkingFailureBlock)failureBlock
       callBack:(NetworkingCallBackBlock)callBackBlock;

+ (void)getRadioListWithRadioID:(NSString *)radioID
                          start:(NSInteger)start
                          limit:(NSInteger)limit
                        success:(NetworkingSuccessBlock)successBlock
                        failure:(NetworkingFailureBlock)failureBlock
                       callBack:(NetworkingCallBackBlock)callBackBlock;

+ (void)getRadioPlayerTingID:(NSString *)tingID
                      success:(NetworkingSuccessBlock)successBlock
                      failure:(NetworkingFailureBlock)failureBlock
                     callBack:(NetworkingCallBackBlock)callBackBlock;

@end
