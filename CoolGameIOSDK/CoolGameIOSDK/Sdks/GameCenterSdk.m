//
//  GameCenterSdk.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/29.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "GameCenterSdk.h"

@implementation GameCenterSdk



#pragma login

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
    [[Kits delegate] loginSuccess:result alias:alias playerId:playerId displayName:displayName];
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
            else
            {
                [CoolGameLog logLogin:@"gamecenter login failed."];
                [self loginSuccess:NO alias:nil playerId:nil displayName:nil];
            }
        };
    }
    
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
