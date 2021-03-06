//
//  FunkyGeneralUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyGeneralUtilities : NSObject

@property (nonatomic, strong) id<NSObject> object;

+ (instancetype)utilitiesWithObject:(id<NSObject>)object;

- (id)apply:(void(^)(id item))block;

@end
