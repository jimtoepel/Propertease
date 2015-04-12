//
//  main.m
//  Propertease
//
//  Created by Jim Toepel on 4/9/15.
//  Copyright (c) 2015 FunderDevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        /*

        Dictionary      System
        */
        
        NSMutableArray *games = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *game;
        
        NSArray *tags = [[NSArray alloc] initWithObjects:@"Gore", @"Hardcore", @"AAA", nil];
        NSData *thoughts = [[NSData alloc] initWithContentsOfFile:@"/tmp/cool.txt"];
        NSString *thoughtsString = [[NSString alloc] initWithData:thoughts encoding:NSUTF8StringEncoding];
        
        game = [NSMutableDictionary dictionary];
        [game setObject:@"Bloodborne"
                 forKey:@"title"];
        [game setObject:[NSNumber numberWithFloat:40.5]
                 forKey:@"hoursPlayed"];
        [game setObject:[NSDate date]
                 forKey:@"dateStarted"];
        [game setObject:[NSNumber numberWithInteger:3]
                 forKey:@"numberOfSessions"];
        [game setObject:[NSNumber numberWithBool:1]
                 forKey:@"complete"];
        [game setObject:tags
                 forKey:@"tags"];
        [game setObject:thoughtsString
                 forKey:@"thoughts"];
        [games addObject:game];
        
        [games writeToFile:@"/tmp/games.plist"
                atomically:YES];
        
        
        NSArray *gameList = [NSArray arrayWithContentsOfFile:@"/tmp/games.plist"];
        
        for (NSDictionary *d in gameList) {
            NSLog(@"I started playing %@ on %@ and have spent %@ hours playing over %@ sessions. %@", [d objectForKey:@"title"],[d objectForKey:@"dateStarted"],[d objectForKey:@"hoursPlayed"], [d objectForKey:@"numberOfSessions"], [d objectForKey:@"complete"]);
            NSLog(@"The tags are: %@", [d objectForKey:@"tags"]);
            NSLog(@"The game impacted me in the following ways: %@", [d objectForKey:@"thoughts"]);
        }
        
    }
    return 0;
}
