//
//  GameCenterSdk.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/29.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "GameCenterSdk.h"

@implementation GameCenterSdk

#pragma user center 

- (instancetype)init
{
    self = [super init];
    if (self) {
        if([self isGameCenterAvailable]) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(authenticationChanged) name:GKPlayerAuthenticationDidChangeNotificationName object:nil];
        }
    }
    return self;
}

-(void) authenticationChanged {
    if ([GKLocalPlayer localPlayer].isAuthenticated &&!userAuthenticated) {
        [CoolGameLog logLogin:@"Authentication changed: player authenticated."];
        userAuthenticated = TRUE;
        [self onLoginSuccess];
    } else if (![GKLocalPlayer localPlayer].isAuthenticated && userAuthenticated) {
        [CoolGameLog logLogin:@"Authentication changed: player not authenticated"];
        userAuthenticated = FALSE;
        [[Kits delegate] onLogout];
    }
}

-(void)showUserCenter {
    [CoolGameLog logGameCenter:@"showUserCenter"];
    if([self isGameCenterAvailable]) {
        
        GKAchievementViewController *achievementController = [[GKAchievementViewController alloc] init];
        if (achievementController != nil) {
            achievementController.achievementDelegate = self;
            
            [[Kits viewController] presentViewController:achievementController animated:YES completion:nil];
        }
    }
}

// The achievement view has finished
- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController {
    [CoolGameLog logGameCenter:@"Achievement View is Closed"];
    if(viewController !=nil){
        [viewController dismissViewControllerAnimated:NO completion:^(void){
            [[Kits delegate] onUserCenterClosed];
        }];
        [viewController.view removeFromSuperview];
        viewController = nil;
    }
}


#pragma sendData -----------------------------------------

-(void)sendData:(NSArray *)params setCallback:(void (^)(NSObject*))callback {
    if([params count] > 0) {
        int func = [params[0] intValue];
        switch (func) {
            case GAMECENTER_REPORTSCORE:
                if(![self isGameCenterAvailable]) return;
                if([params count] > 2) {
                    int64_t score = [params[1] intValue];
                    NSString * category = params[2];
                    GKScore * scoreReporter = [[GKScore alloc] initWithCategory:category];
                    scoreReporter.value = score;
                    [scoreReporter reportScoreWithCompletionHandler:^(NSError * error){
                        if(nil != error) {
                            [CoolGameLog logGameCenter:[NSString stringWithFormat:@"sendData:%d, score:%lld, category:%@, err:%@", func, score, category, error]];
                            if(nil != callback) {
                                callback(error);
                            }
                        }
                        else {
                            if(nil != callback) {
                                callback(nil);
                            }
                        }
                    }];
                }
                else {
                    [CoolGameLog logGameCenter:@"error params for GAMECENTER_REPORTSCORE."];
                }
                break;
            case GAMECENTER_REPORTACHIEVEMENT:
                if(![self isGameCenterAvailable]) return;
                if([params count] > 2) {
                    NSString * id = params[1];
                    float percent = [params[2] floatValue];
                    GKAchievement* achievement = [[GKAchievement alloc] initWithIdentifier:id];
                    [self unlockAchievement:achievement percent:percent];
                    if(callback) {
                        callback(nil);
                    }
                }
                else {
                    [CoolGameLog logGameCenter:@"error params for GAMECENTER_REPORTSCORE."];
                }
                break;
            case GAMECENTER_UNLOCKACHIEVEMENT:
                if(![self isGameCenterAvailable]) return;
                if([params count] > 2) {
                    
                }
                else {
                    [CoolGameLog logGameCenter:@"error params for GAMECENTER_UNLOCKACHIEVEMENT."];
                }
                break;
            default:
                break;
        }
    }
}
//通过成就指针汇报成就
- (void) unlockAchievement:(GKAchievement *)achievement percent:(float)percent
{
    if ( achievement != nil )
    {
        achievement.percentComplete = percent;
        achievement.showsCompletionBanner = YES;
        [achievement reportAchievementWithCompletionHandler:^(NSError* error){
            if ( error != nil)
            {
                NSLog(@"上传成就错误，错误提示为\n%@", error);
            }
            else
            {
                NSLog(@"上传成就成功\n");
                [self displayAchievement:achievement];
            }
        }];
    }
}
//打印某个成就
- (void) displayAchievement:(GKAchievement*)achievement
{
    if ( achievement == nil) return;
    
    NSLog(@"completed:%d", achievement.completed);
    NSLog(@"lastReportDate:%@", achievement.lastReportedDate);
    NSLog(@"percentComplete:%f", achievement.percentComplete);
    NSLog(@"identifier:%@", achievement.identifier);
}

#pragma login -----------------------------------------

-(void)doLogin {
    [Kits showLoading:@"Logining..."];
    [CoolGameLog logLogin:@"CoolGameLoginKit setup"];
    //    self._delegate = delegate;
    
    if([self isGameCenterAvailable]) {
        [self loginGameCenter];
        //        [self loginSuccess];
    }
    else {
        [Kits hideLoading];
        [[Kits alert] alert:@"GameCenter isn't supported!"];
    }
}

-(void) loginSuccess:(BOOL)result alias:(NSString*)alias playerId:(NSString*)playerId displayName:(NSString*)displayName {
    [Kits hideLoading];
    [CoolGameLog logLogin:@"CoolGameLoginKit loginSuccess"];
    [[Kits delegate] onLoginSuccess:result alias:alias playerId:playerId displayName:displayName];
}

-(BOOL) isGameCenterAvailable {
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
    
    return (gcClass && osVersionSupported);
}

-(void) loginGameCenter {
    __weak GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    if(localPlayer.isAuthenticated) {
        [self loginSuccess:YES alias:localPlayer.alias playerId:localPlayer.playerID displayName:localPlayer.displayName];
    }
    else {
        localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error)
        {
            if(viewController)
            {
                [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:viewController animated:YES completion:nil];
            }
            else if(localPlayer.isAuthenticated == YES)
            {
                [self onLoginSuccess];
            }
            else
            {
                [CoolGameLog logLogin:@"gamecenter login failed."];
                [self loginSuccess:NO alias:nil playerId:nil displayName:nil];
            }
        };
    }
    
}

-(void) onLoginSuccess {
    __weak GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [CoolGameLog logLogin:@"gamecenter login success."];
    [CoolGameLog logLogin:[NSString stringWithFormat:@"alias:%@", localPlayer.alias]];
    [CoolGameLog logLogin:[NSString stringWithFormat:@"authenticated:%d", localPlayer.authenticated]];
    [CoolGameLog logLogin:[NSString stringWithFormat:@"playerID:%@", localPlayer.playerID]];
    [CoolGameLog logLogin:[NSString stringWithFormat:@"displayName:%@", localPlayer.displayName]];
    [CoolGameLog logLogin:[NSString stringWithFormat:@"description:%@", localPlayer.description]];
    [CoolGameLog logLogin:[NSString stringWithFormat:@"debugDescription:%@", localPlayer.debugDescription]];
    
    [CoolGameLog logLogin:[NSString stringWithFormat:@"underage:%d", localPlayer.underage]];
    [self loginSuccess:YES alias:localPlayer.alias playerId:localPlayer.playerID displayName:localPlayer.displayName];
    
    //            [localPlayer generateIdentityVerificationSignatureWithCompletionHandler:^(NSURL *publicKeyUrl, NSData *signature, NSData *salt, uint64_t timestamp, NSError *error) {
    //
    //                if(error != nil)
    //                {
    //                    return; //some sort of error, can't authenticate right now
    //                }
    //                //                [self verifyPlayer:localPlayer.playerID publicKeyUrl:publicKeyUrl signature:signature salt:salt timestamp:timestamp];
    //
    //
    //            }];
}

//-(void)verifyPlayer:(NSString *)playerID publicKeyUrl:(NSURL *)publicKeyUrl signature:(NSData *)signature salt:(NSData *)salt timestamp:(uint64_t)timestamp
//{
//    //get certificate
//    NSData *certificateData = [NSData dataWithContentsOfURL:publicKeyUrl];
//
//    //build payload
//    NSMutableData *payload = [[NSMutableData alloc] init];
//    [payload appendData:[playerID dataUsingEncoding:NSASCIIStringEncoding]];
//    [payload appendData:[[[NSBundle mainBundle] bundleIdentifier] dataUsingEncoding:NSASCIIStringEncoding]];
//
//    uint64_t timestampBE = CFSwapInt64HostToBig(timestamp);
//    [payload appendBytes:&timestampBE length:sizeof(timestampBE)];
//    [payload appendData:salt];
//
//    //sign
//    SecCertificateRef certificateFromFile = SecCertificateCreateWithData(NULL, (__bridge CFDataRef)certificateData); // load the certificate
//    SecPolicyRef secPolicy = SecPolicyCreateBasicX509();
//
//    SecTrustRef trust;
//    OSStatus statusTrust = SecTrustCreateWithCertificates( certificateFromFile, secPolicy, &trust);
//    if(statusTrust != errSecSuccess)
//    {
//        NSLog(@"could not create trust");
//        return;
//    }
//
//    SecTrustResultType resultType;
//    OSStatus statusTrustEval =  SecTrustEvaluate(trust, &resultType);
//    if(statusTrustEval != errSecSuccess)
//    {
//        NSLog(@"could not evaluate trust");
//        return;
//    }
//
//    if(resultType != kSecTrustResultProceed && resultType != kSecTrustResultRecoverableTrustFailure)
//    {
//        NSLog(@"server can not be trusted");
//        return;
//    }
//
//    SecKeyRef publicKey = SecTrustCopyPublicKey(trust);
//    uint8_t sha1HashDigest[CC_SHA1_DIGEST_LENGTH];
//    CC_SHA1([payload bytes], [payload length], sha1HashDigest);
//
//    //check to see if its a match
//    OSStatus verficationResult = SecKeyRawVerify(publicKey,  kSecPaddingPKCS1SHA1, sha1HashDigest, CC_SHA1_DIGEST_LENGTH, [signature bytes], [signature length]);
//
//    CFRelease(publicKey);
//    CFRelease(trust);
//    CFRelease(secPolicy);
//    CFRelease(certificateFromFile);
//    if (verficationResult == errSecSuccess)
//    {
//        NSLog(@"Verified");
//    }
//    else
//    {
//        NSLog(@"Danger!!!");
//    }
//}




@end
