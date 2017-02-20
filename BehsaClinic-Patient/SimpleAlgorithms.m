//
//  SimpleAlgorithms.m
//  BehsaClinic-Patient
//
//  Created by Arash Z. Jahangiri on 2/14/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "SimpleAlgorithms.h"

@implementation SimpleAlgorithms

+ (NSArray *)bubbleSort:(NSArray *)arrayToBeSorted ascendingOrder:(BOOL)sortInAscendingOrder {
    // As we can't swap integers in a static array, make a mutable array out of the given static array.
    NSMutableArray *muArrRaw = [[NSMutableArray alloc] initWithArray:arrayToBeSorted];
    
    BOOL swapped;
    NSUInteger n = [muArrRaw count];
    // iterate through the array as rounds
    do {
        swapped = NO;
        // iterate through each element of the array with the given range
        for (NSUInteger j = 0; j + 1 < n; j++) {
            // comparison
            if (sortInAscendingOrder && [muArrRaw[j] compare:muArrRaw[j+1]] == NSOrderedDescending) {
                [muArrRaw exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                swapped = YES;
            } else if (!sortInAscendingOrder && [muArrRaw[j] compare:muArrRaw[j+1]] == NSOrderedAscending) {
                [muArrRaw exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                swapped = YES;
            }
        }
    } while (swapped);
    
    // return the sorted array
    return [muArrRaw copy];
}

+(NSArray *)selectionSort:(NSMutableArray *)unsortedDataArray{
    int pointerMin;
    int i,j,selectionSortCount;
    long count = unsortedDataArray.count;
    
    for (j=0; j<count;j++ )
    {
        //for each element in the array, assume that the first element is the minimum number
        pointerMin =j;
        for (i=j+1;i<count;i++)
        {
            //Iterate through each element in the array starting from the next element and compare with minimum number set from the outer for loop
            if ([unsortedDataArray objectAtIndex:i] < [unsortedDataArray objectAtIndex:pointerMin] )
            {
                pointerMin = i; //Change pointer to minimum number if new min found
                selectionSortCount++;
            }
        }
        if (pointerMin !=j) //if new pointer is not same as the old pointer then swap
        {
            [unsortedDataArray exchangeObjectAtIndex:j withObjectAtIndex:pointerMin];
        }
    }
    return unsortedDataArray;
}

+(NSArray *)insertionSort:(NSMutableArray *)unsortedDataArray
{
    long count = unsortedDataArray.count;
    int i,j,insertionSortCount;
    for (i=1; i<count;i++)
    {
        j=i;
        while(j>0 && [[unsortedDataArray objectAtIndex:(j-1)] intValue] > [[unsortedDataArray objectAtIndex:j] intValue])
        {
            [unsortedDataArray exchangeObjectAtIndex:j withObjectAtIndex:(j-1)];
            j=j-1;
            insertionSortCount++;
        }
    }
    return unsortedDataArray;
}

+(NSArray *)quickSort:(NSMutableArray *)unsortedDataArray
{
    int quickSortCount;
    NSMutableArray *lessArray = [[NSMutableArray alloc] init];
    NSMutableArray *greaterArray =[[NSMutableArray alloc] init];
    if ([unsortedDataArray count] <1)
    {
        return nil;
    }
    int randomPivotPoint = arc4random() % [unsortedDataArray count];
    NSNumber *pivotValue = [unsortedDataArray objectAtIndex:randomPivotPoint];
    [unsortedDataArray removeObjectAtIndex:randomPivotPoint];
    for (NSNumber *num in unsortedDataArray)
    {
        quickSortCount++; //This is required to see how many iterations does it take to sort the array using quick sort
        if (num < pivotValue)
        {
            [lessArray addObject:num];
        }
        else
        {
            [greaterArray addObject:num];
        }
    }
    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    [sortedArray addObjectsFromArray:[self quickSort:lessArray]];
    [sortedArray addObject:pivotValue];
    [sortedArray addObjectsFromArray:[self quickSort:greaterArray]];
    return sortedArray;
}

+(NSArray *)mergeSort:(NSArray *)unsortedArray
{
    if ([unsortedArray count] < 2)
    {
        return unsortedArray;
    }
    long middle = ([unsortedArray count]/2);
    NSRange left = NSMakeRange(0, middle);
    NSRange right = NSMakeRange(middle, ([unsortedArray count] - middle));
    NSArray *rightArr = [unsortedArray subarrayWithRange:right];
    NSArray *leftArr = [unsortedArray subarrayWithRange:left];
    //Or iterate through the unsortedArray and create your left and right array
    //for left array iteration starts at index =0 and stops at middle, for right array iteration starts at midde and end at the end of the unsorted array
    NSArray *resultArray =[self merge:[self mergeSort:leftArr] andRight:[self mergeSort:rightArr]];
    return resultArray;
}

+(NSArray *)merge:(NSArray *)leftArr andRight:(NSArray *)rightArr
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    int right = 0;
    int left = 0;
    while (left < [leftArr count] && right < [rightArr count])
    {
        if ([[leftArr objectAtIndex:left] intValue] < [[rightArr objectAtIndex:right] intValue])
        {
            [result addObject:[leftArr objectAtIndex:left++]];
        }
        else
        {
            [result addObject:[rightArr objectAtIndex:right++]];
        }
    }
    NSRange leftRange = NSMakeRange(left, ([leftArr count] - left));
    NSRange rightRange = NSMakeRange(right, ([rightArr count] - right));
    NSArray *newRight = [rightArr subarrayWithRange:rightRange];
    NSArray *newLeft = [leftArr subarrayWithRange:leftRange];
    newLeft = [result arrayByAddingObjectsFromArray:newLeft];
    return [newLeft arrayByAddingObjectsFromArray:newRight];
}
@end
