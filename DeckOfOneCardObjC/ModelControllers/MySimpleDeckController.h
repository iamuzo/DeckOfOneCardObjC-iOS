//
//  MySimpleDeckController.h
//  DeckOfOneCardObjC
//
//  Created by Uzo on 1/28/20.
//  Copyright © 2020 Uzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MySimpleDeck.h"

NS_ASSUME_NONNULL_BEGIN

@interface MySimpleDeckController : NSObject

+ (void)fetchNewCard: (NSString *)nothing completion: (void (^_Nullable) (MySimpleDeck *_Nullable))completion;

+ (void)fetchCardImage: (MySimpleDeck *)deck completion: (void (^_Nullable) (UIImage *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
