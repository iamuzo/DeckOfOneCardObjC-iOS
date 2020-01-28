//
//  MySimpleDeck.m
//  DeckOfOneCardObjC
//
//  Created by Uzo on 1/28/20.
//  Copyright © 2020 Uzo. All rights reserved.
//

#import "MySimpleDeck.h"

@implementation MySimpleDeck

- (instancetype)initWithCard:(NSString *)card
                        suit:(NSString *)suit
                    imageURL:(NSString *)imageURL
{
    self = [super init];
    if (self) {
        _card = card;
        _suit = suit;
        _imageURL = imageURL;
    }
    return self;
}

@end

@implementation MySimpleDeck (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary

{
    NSArray *cardsArray = dictionary[@"cards"];
    NSString *card = dictionary[@"value"];
    NSString *suit = dictionary[@"suit"];
    NSString *imageURL = dictionary[@"image"];
    
    for (NSDictionary *dictionary in cardsArray)
    {
        card = dictionary[@"value"];
        suit = dictionary[@"suit"];
        imageURL = dictionary[@"images"][@"png"];
        
    }
    
    return [self initWithCard:card suit:suit imageURL:imageURL];
}

@end
