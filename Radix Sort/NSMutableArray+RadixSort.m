//
//  NSMutableArray+RadixSort.m
//  Radix Sort
//
//  Created by Stevenson on 27/02/2014.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "NSMutableArray+RadixSort.h"
#import "RadixNode.h"

@implementation NSMutableArray (RadixSort)

+(NSMutableArray*) getTableOfEmptyBucketsForSize:(NSInteger) size
{
    NSMutableArray *empty = [NSMutableArray new];
    for (NSInteger i = 0; i < size; i++) {
        [empty addObject:[RadixNode new]];
    }
    
    return empty;
}

+(NSInteger) getExaminedNumber:(NSInteger) number withBase:(NSInteger) base atDigit:(NSInteger) digit
{
    NSInteger divisor = (digit == 0) ? 1 : (pow(base, digit));
    return (number/divisor) % base;
}

+(NSMutableArray*) makeRadixTableForArray: (NSMutableArray*) theArray forBase:(NSInteger) base forDigit:(NSInteger) digit
{
    NSMutableArray *radixTable = [self getTableOfEmptyBucketsForSize:base];
    for (int i=0;i<theArray.count;i++) {
        NSInteger value =[[theArray objectAtIndex:i] integerValue];
        NSInteger radixIndex = [self getExaminedNumber:value withBase:base atDigit:digit];
        RadixNode *current = (RadixNode*)[radixTable objectAtIndex:radixIndex];
        if (current.next) {
            while (current.next) {
                
                current = [current next];
            }
        }
        RadixNode *newEntry = [RadixNode new];
        newEntry.data = [[theArray objectAtIndex:i] integerValue];
        current.next = newEntry;
    }
    
    return radixTable;
}

+(NSMutableArray*) makeArrayFromRadixTable: (NSMutableArray*) radixTable
{
    NSMutableArray *theArray = [NSMutableArray new];
    for (RadixNode *bucketNode in radixTable){
        RadixNode *bucket = bucketNode.next;
        while (bucket) {
            [theArray addObject:@(bucket.data)];
            bucket = bucket.next;
        }
    }
    return theArray;
}

+(NSMutableArray*) radixSort: (NSMutableArray*) theArray forBase:(NSInteger) base
{
    theArray = [theArray copy];
    int max = [[theArray valueForKeyPath:@"@max.intValue"] intValue];
    int numberOfSteps = (log(max) / log(base))+1;
    for (int i=0; i< numberOfSteps;i++) {
        NSMutableArray *radixTable = [self makeRadixTableForArray:theArray forBase:base forDigit:i];
        theArray = [self makeArrayFromRadixTable:radixTable];
    }
    return theArray;
}

@end
