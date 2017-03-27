//
//  LTNilTolerantNSArray.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "LTNSArraySubclass.h"
#import "LTNSMutableArraySubclass.h"

#pragma mark - NSArray Subclasses

@interface LTNilTolerantNSArray : LTNSArraySubclass

@end

@interface LTNilTolerantNSMutableArray : LTNSMutableArraySubclass

@end

#pragma mark - NSArray Categories

@interface NSArray (LTNilTolerant)

- (LTNilTolerantNSArray*)nilTolerant;

@end

@interface NSMutableArray (LTNilTolerant)

- (LTNilTolerantNSMutableArray*)nilTolerant;

@end
