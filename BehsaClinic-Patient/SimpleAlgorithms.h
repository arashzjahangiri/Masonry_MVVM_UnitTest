//
//  SimpleAlgorithms.h
//  BehsaClinic-Patient
//
//  Created by Arash Z. Jahangiri on 2/14/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleAlgorithms : NSObject
+ (NSArray *)bubbleSort:(NSArray *)arrayToBeSorted ascendingOrder:(BOOL)sortInAscendingOrder;
+(NSArray *)selectionSort:(NSMutableArray *)unsortedDataArray;
+(NSArray *)insertionSort:(NSMutableArray *)unsortedDataArray;
+(NSArray *)quickSort:(NSMutableArray *)unsortedDataArray;
+(NSArray *)mergeSort:(NSArray *)unsortedArray;
@end
