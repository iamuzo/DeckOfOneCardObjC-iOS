//
//  MySimpleDeck.h
//  DeckOfOneCardObjC
//
//  Created by Uzo on 1/28/20.
//  Copyright © 2020 Uzo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MySimpleDeck : NSObject

@property (nonatomic, readonly) NSString *card;
@property (nonatomic, readonly) NSString *suit;
@property (nonatomic, readonly) NSString *imageURL;

- (instancetype)initWithCard: (NSString *)card
                        suit: (NSString *)suit
                    imageURL: (NSString *)imageURL;

@end

@interface MySimpleDeck (JSONConvertable)

- (instancetype)initWithDictionary: (NSDictionary<NSString *, id>*)dictionary;
@end

NS_ASSUME_NONNULL_END
