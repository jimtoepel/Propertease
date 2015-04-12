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
        Array           ????
        Dictionary      System
        String          Name
        Data
        Date            Started
        Integer         Times Played
        float           Hours Played
        boolean         Finished?
        */
        
        NSMutableArray *games = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *game;
        
        game = [NSMutableDictionary dictionary];
        [game setObject:@"Bloodborne"
                 forKey:@"title"];
        [game setObject:[NSNumber numberWithFloat:40.5]
                 forKey:@"hoursPlayed"];
        [game setObject:[NSDate date]
                 forKey:@"dateStarted"];
        [game setObject:[NSNumber numberWithInteger:3]
                 forKey:@"numberOfSessions"];
        [games addObject:game];
        
        [games writeToFile:@"/tmp/games.plist"
                atomically:YES];
        
        
        NSArray *gameList = [NSArray arrayWithContentsOfFile:@"/tmp/games.plist"];
        
        for (NSDictionary *d in gameList) {
            NSLog(@"I started playing %@ on %@ and have spent %@ hours playing over %@ sessions.", [d objectForKey:@"title"],[d objectForKey:@"dateStarted"],[d objectForKey:@"hoursPlayed"], [d objectForKey:@"numberOfSessions"]);
        }
        
    }
    return 0;
}
