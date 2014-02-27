//
//  NSMutableArray+RadixSort.h
//  Radix Sort
//
//  Created by Stevenson on 27/02/2014.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (RadixSort)

/**
 *
 * Sort algorithm that uses radix sort for a given base.
 * @param NSMutableArray theArray a NSMutable Array of values of NSNumbers to be sorted.
 * 
 * @param NSInteger base a logarithmic base for the values to be sorted from. Typical would be base 10 for NSNumbers, but can sort any base if necessary
 * @return NSMutableArray sorted array
 *
 **/
+(NSMutableArray*) radixSort: (NSMutableArray*) theArray forBase:(NSInteger) base;

@end
