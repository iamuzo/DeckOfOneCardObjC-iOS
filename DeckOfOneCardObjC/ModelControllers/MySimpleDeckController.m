//
//  MySimpleDeckController.m
//  DeckOfOneCardObjC
//
//  Created by Uzo on 1/28/20.
//  Copyright © 2020 Uzo. All rights reserved.
//

#import "MySimpleDeckController.h"
#import "MySimpleDeck.h"

static NSString *const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/?count=1";

@implementation MySimpleDeckController

+ (void)fetchNewCard:(NSString *)nothing completion:(void (^)(MySimpleDeck * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:baseURLString];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
           NSLog(@"Error fetching deck from server: %@", error);
            completion(nil);
            return;
        }
        
        if (data) {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if (!topLevelDictionary) {
                NSLog(@"Error fetching deck DATA from serve: %@", error);
                completion(nil);
                return;
            }
            
            MySimpleDeck *deck = [[MySimpleDeck alloc] initWithDictionary:topLevelDictionary];
            completion(deck);
        }
    }] resume];
}

+ (void)fetchCardImage:(MySimpleDeck *)deck completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:deck.imageURL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable respons, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
            completion(nil);
            return;
        }
        
        if (data) {
            UIImage *image = [[UIImage alloc] initWithData:data];
            completion(image);
        }
        
    }] resume];
}

@end
