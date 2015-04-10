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
        [game setObject:@"M"
                 forKey:@"rating"];
        [games addObject:game];
        
        [games writeToFile:@"/tmp/games.plist"
                atomically:YES];
        
        
        NSArray *gameList = [NSArray arrayWithContentsOfFile:@"/tmp/games.plist"];
        
        for (NSDictionary *d in gameList) {
            NSLog(@"I have spent %@ hours playing %@", [d objectForKey:@"hoursPlayed"],[d objectForKey:@"title"]);
        }
        
    }
    return 0;
}
