//
//  LTNilStoringNSArray.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "LTNSArraySubclass.h"
#import "LTNSMutableArraySubclass.h"

#pragma mark - NSArray Subclasses

@interface LTNilStoringNSArray : LTNSArraySubclass

@end

@interface LTNilStoringNSMutableArray : LTNSMutableArraySubclass

@end

#pragma mark - NSArray Categories

@interface NSArray (LTNilStoring)

- (LTNilStoringNSArray*)nilStoring;

@end

@interface NSMutableArray (LTNilStoring)

- (LTNilStoringNSMutableArray*)nilStoring;

@end
