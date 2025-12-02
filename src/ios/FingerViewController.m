#import "FingerViewController.h"

@interface FingerViewController () {
    int saveCount;
}

@end

@implementation FingerViewController
@synthesize callbackId = _callbackId;


+ (instancetype)sharedHelper:(NSString *)callbackid {
    
    static FingerViewController *sharedClass = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClass = [[self alloc] init];
        sharedClass.callbackId = callbackid;
    });

    return sharedClass;
}


-(void)startConfig{
    VeridiumLicenseStatus *sdkStatus = [VeridiumSDK setup:@"iGHT0PY1h/gZnncdrLnMbz/qLiSW9sMrt1gAMt4QxNwR4OTz89E3RYtgURhLXGFDuGcxftZ9E6yYwsHdVCjDC3siZGV2aWNlRmluZ2VycHJpbnQiOiJsTkFaa09FMFl1aDdZN2NlT1VwOVQwd2pRcUZqaTBiTTMwUFBSRytHakEwPSIsImxpY2Vuc2UiOiJSMWVsZ1U3MWVUdTVzaG5Hem9jc3IybEpVcmZuV05LUDlDR1FpS0xRaDVQVDRDRC95ZmxMeXFwSytaT1pzTFZJS3cxdE5KTER3ckxkSEhROWVoaVlCM3NpZEhsd1pTSTZJbE5FU3lJc0ltNWhiV1VpT2lKVFJFc2lMQ0pzWVhOMFRXOWthV1pwWldRaU9qRTNORGcxTXpZNE9URXNJbU52YlhCaGJubE9ZVzFsSWpvaVNXNXpiMngxZEdsdmJuTWdMU0JGYm5SbGJDQkJkWFJ2VTJGc1pYTWlMQ0pqYjI1MFlXTjBTVzVtYnlJNklsQnliMlIxWTNScGIyNGdORVpGSUNCbGVIQnBjbVVnU25WdVpTQXpNQ3dnTWpBeU5WeHVZMjl0TG1WdWRHVnNMbTF2ZG1sc0xHTnZiUzVsYm5SbGJDNXRiM1pwYkM1aGRYUnZZV04wYVhaaFkybHZiaXhqYjIwdVpXNTBaV3d1Ylc5MmFXd3ViV2xvZFdWc2JHRXNhWE5rYVdkcGRHRnNMbWxrWlc1MGFXUmhaQzVsYm5SbGJHVnRjQ3hqYjIwdWIzVjBjM2x6ZEdWdGMyVnVkR1Z5Y0hKcGMyVXVaVzUwWld3dVVFVk5ZWGx2Y21semRHRXNZMjl0TG1WdWRHVnNMbU52Ym5OMWJIUnBkbThzWTI5dExtVnVkR1ZzTG0xdmRtbHNMbUZ3Y0dSbGJHbDJaWEo1TEdOdmJTNXZkWFJ6ZVhOMFpXMXpaVzUwWlhKd2NtbHpaUzVsYm5SbGJDNUZiblJsYkZSbGNuSmxibThpTENKamIyNTBZV04wUlcxaGFXd2lPaUpxYjI1dFlYSXVjR1Z5WlhwQWFXNXpiMngxZEdsdmJuTXVjR1VpTENKemRXSk1hV05sYm5OcGJtZFFkV0pzYVdOTFpYa2lPaUpWU2s1Rk4zcFpOVEZTYTJ4blFrcG5SSHBMUTNwa1kycFFXV3hTTTJaRFFtZ3hZMk42VVRsUVJuZFZQU0lzSW5OMFlYSjBSR0YwWlNJNk1UYzBPRFE1TVRJd01Dd2laWGh3YVhKaGRHbHZia1JoZEdVaU9qRTNPREkzT1RJd01EQXNJbWR5WVdObFJXNWtSR0YwWlNJNk1UYzRNamsyTkRnd01Dd2lkWE5wYm1kVFFVMU1WRzlyWlc0aU9tWmhiSE5sTENKMWMybHVaMFp5WldWU1FVUkpWVk1pT21aaGJITmxMQ0oxYzJsdVowRmpkR2wyWlVScGNtVmpkRzl5ZVNJNlptRnNjMlVzSW1KcGIyeHBZa1poWTJWRmVIQnZjblJGYm1GaWJHVmtJanBtWVd4elpTd2ljblZ1ZEdsdFpVVnVkbWx5YjI1dFpXNTBJanA3SW5ObGNuWmxjaUk2Wm1Gc2MyVXNJbVJsZG1salpWUnBaV1FpT21aaGJITmxmU3dpWlc1bWIzSmpaU0k2ZXlKd1lXTnJZV2RsVG1GdFpYTWlPbHNpYVhOa2FXZHBkR0ZzTG1sa1pXNTBhV1JoWkM1bGJuUmxiR1Z0Y0NJc0ltTnZiUzVsYm5SbGJDNXRiM1pwYkM1aGRYUnZZV04wYVhaaFkybHZiaUlzSW1OdmJTNWxiblJsYkM1dGIzWnBiQzVoY0hCa1pXeHBkbVZ5ZVNJc0ltTnZiUzVsYm5SbGJDNWpiMjV6ZFd4MGFYWnZJaXdpWTI5dExtOTFkSE41YzNSbGJYTmxiblJsY25CeWFYTmxMbVZ1ZEdWc0xrVnVkR1ZzVkdWeWNtVnVieUlzSW1OdmJTNWxiblJsYkM1dGIzWnBiQ0lzSW1OdmJTNWxiblJsYkM1dGIzWnBiQzV0YVdoMVpXeHNZU0lzSW1OdmJTNXZkWFJ6ZVhOMFpXMXpaVzUwWlhKd2NtbHpaUzVsYm5SbGJDNVFSVTFoZVc5eWFYTjBZU0pkTENKelpYSjJaWEpEWlhKMFNHRnphR1Z6SWpwYlhYMTkifQ=="];

    if(!sdkStatus.initSuccess){
        return;
    }

    VeridiumLicenseStatus *status4F = [VeridiumSDK.sharedSDK setupLib4FWithLicense:@"WtBAPpyr+HyLkQp4+PEAilTYXbjkgVDGMONtbZ6+ZMIXHHCPsJzVLDGeBzVEvvAkOpreGxPZ23aVCtT5sgiZD3siZGV2aWNlRmluZ2VycHJpbnQiOiJsTkFaa09FMFl1aDdZN2NlT1VwOVQwd2pRcUZqaTBiTTMwUFBSRytHakEwPSIsImxpY2Vuc2UiOiJFWW8yMmZVb1lVcXJCTTl4WEp0V1dTcHJsVVhVTmlTYk1GKzhFSTVjazhka05wZTYvYzZyNXNtTWtsK3doUG0zSFlURUUrWmZrVitSa3dOODZOcVlCM3NpZEhsd1pTSTZJa0pKVDB4SlFsTWlMQ0p1WVcxbElqb2lORVlpTENKc1lYTjBUVzlrYVdacFpXUWlPakUzTkRnMU16WTRPVEUyTmprc0ltTnZiWEJoYm5sT1lXMWxJam9pU1c1emIyeDFkR2x2Ym5NZ0xTQkZiblJsYkNCQmRYUnZVMkZzWlhNaUxDSmpiMjUwWVdOMFNXNW1ieUk2SWxCeWIyUjFZM1JwYjI0Z05FWkZJQ0JsZUhCcGNtVWdTblZ1WlNBek1Dd2dNakF5TlZ4dVkyOXRMbVZ1ZEdWc0xtMXZkbWxzTEdOdmJTNWxiblJsYkM1dGIzWnBiQzVoZFhSdllXTjBhWFpoWTJsdmJpeGpiMjB1Wlc1MFpXd3ViVzkyYVd3dWJXbG9kV1ZzYkdFc2FYTmthV2RwZEdGc0xtbGtaVzUwYVdSaFpDNWxiblJsYkdWdGNDeGpiMjB1YjNWMGMzbHpkR1Z0YzJWdWRHVnljSEpwYzJVdVpXNTBaV3d1VUVWTllYbHZjbWx6ZEdFc1kyOXRMbVZ1ZEdWc0xtTnZibk4xYkhScGRtOHNZMjl0TG1WdWRHVnNMbTF2ZG1sc0xtRndjR1JsYkdsMlpYSjVMR052YlM1dmRYUnplWE4wWlcxelpXNTBaWEp3Y21selpTNWxiblJsYkM1RmJuUmxiRlJsY25KbGJtOGlMQ0pqYjI1MFlXTjBSVzFoYVd3aU9pSnFiMjV0WVhJdWNHVnlaWHBBYVc1emIyeDFkR2x2Ym5NdWNHVWlMQ0p6ZFdKTWFXTmxibk5wYm1kUWRXSnNhV05MWlhraU9pSlZTazVGTjNwWk5URlNhMnhuUWtwblJIcExRM3BrWTJwUVdXeFNNMlpEUW1neFkyTjZVVGxRUm5kVlBTSXNJbk4wWVhKMFJHRjBaU0k2TVRjME9EUTVNVEl3TURBd01Dd2laWGh3YVhKaGRHbHZia1JoZEdVaU9qRTNPREkzT1RJd01EQXdNREFzSW1keVlXTmxSVzVrUkdGMFpTSTZNVGM0TWprMk5EZ3dNREF3TUN3aWRYTnBibWRUUVUxTVZHOXJaVzRpT21aaGJITmxMQ0oxYzJsdVowWnlaV1ZTUVVSSlZWTWlPbVpoYkhObExDSjFjMmx1WjBGamRHbDJaVVJwY21WamRHOXllU0k2Wm1Gc2MyVXNJbUpwYjJ4cFlrWmhZMlZGZUhCdmNuUkZibUZpYkdWa0lqcG1ZV3h6WlN3aWNuVnVkR2x0WlVWdWRtbHliMjV0Wlc1MElqcDdJbk5sY25abGNpSTZabUZzYzJVc0ltUmxkbWxqWlZScFpXUWlPbVpoYkhObGZTd2labVZoZEhWeVpYTWlPbnNpWW1GelpTSTZkSEoxWlN3aWMzUmxjbVZ2VEdsMlpXNWxjM01pT25SeWRXVXNJbVY0Y0c5eWRDSTZkSEoxWlgwc0ltVnVabTl5WTJWa1VISmxabVZ5Wlc1alpYTWlPbnNpYldGdVpHRjBiM0o1VEdsMlpXNWxjM01pT21aaGJITmxmU3dpZG1WeWMybHZiaUk2SWlvdUtpSjkifQ=="];

    if(!status4F.initSuccess){
        return;
    }
    
    [VeridiumSDK.sharedSDK register4FUIEnroller];
    [VeridiumSDK.sharedSDK register4FUIExporter];
    [VeridiumSDK.sharedSDK register4FUIAuthenticator];
    

    NSString *ver1 = VeridiumSDK.sdkVersion;
    NSString *ver2 = VeridiumSDK.sharedSDK.lib4FVersion;
    NSLog(@"VeridiumSDK: %@", ver1);
    NSLog(@"Veridium4FSDK: %@", ver2);
    
    return;
}



- (void)viewDidLoad {
    [super viewDidLoad];
}


NSInteger *fingerValue;
Boolean *livenessValue;

- (void)onExportFingerWithLeftCode:(NSInteger)leftCode andRightCode:(NSInteger)rightCode andLiveness:(Boolean)liveness {
    
    [self startConfig];
  
    if (rightCode == 0) {
          return;
    }
  
  	fingerValue = &rightCode;
    livenessValue = &liveness;
    
    [self initiateVeridium];
}



- (void) initiateVeridium {
    VeridiumFourFCaptureConfig *configVeridium = [[VeridiumFourFCaptureConfig alloc] init];
    NSMutableSet *fingers = [[NSMutableSet alloc] init];
    NSNumber *finger = [NSNumber numberWithInteger: *fingerValue];
    [fingers addObject:finger];
    
    [configVeridium setExportFormat:FORMAT_JSON];
    [configVeridium setFixed_print_width:(512)];
    [configVeridium setFixed_print_height:(512)];
    [configVeridium setWsq_compression_ratio:COMPRESS_5to1];
    [configVeridium setPack_wsq:YES];
    [configVeridium setPack_bmp:NO];
    [configVeridium setPack_raw:NO];
    [configVeridium setPack_png:NO];
    [configVeridium setUseLiveness:YES];
    [configVeridium setLiveness_factor:99];
   // [configVeridium setActive_liveness_beta:*livenessValue];
    [configVeridium setTargetIndexFinger:NO];
    [configVeridium setTargetLittleFinger:NO];
    [configVeridium setPack_audit_image:YES];
    [configVeridium setCalculate_nfiq:YES];
    [configVeridium setNist_type:Nist_type_T14_9];
    [configVeridium setFingers:fingers];
    [configVeridium setCanSwitch:NO];
    [configVeridium setDo_debug:NO];
    configVeridium.do_export = YES;
    
    [configVeridium configureTimeoutEnabled:YES withTimeoutCanRestart:YES andTimoutSeconds:45 andAllowedRetries:3];
    
    [VeridiumBiometricsFourFService exportTemplate:configVeridium onSuccess:^(NSData * _Nonnull data) {
        NSError *e = nil;
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error: &e];
        
        NSArray *fingerPrints = [json valueForKey: @"Fingerprints"];
        NSDictionary *wsq = [[[fingerPrints objectAtIndex:0] valueForKey:@"FingerImpressionImage"] valueForKey:@"BinaryBase64ObjectWSQ"];
        
        NSDictionary *auditImage = [json valueForKey: @"AuditImage_0"];
        NSDictionary *img = [auditImage valueForKey:@"BinaryBase64ObjectJPG"];
        
        NSMutableDictionary * dict = [NSMutableDictionary new];
                                    [dict setObject:wsq forKey:@"wsq"];
                                    [dict setObject:img forKey:@"img"];

        [EntelFingerPlugin.entelFingerPlugin sendResponseFingerDict:dict callbackId:self.callbackId];
        
    } onFail:^{
      [EntelFingerPlugin.entelFingerPlugin sendResponseFingerDict:@"FAIL" callbackId:self.callbackId];
    } onCancel:^{
      [EntelFingerPlugin.entelFingerPlugin sendResponseFingerDict:@"CANCEL" callbackId:self.callbackId];
    } onError:^(NSError * _Nonnull error) {
      [EntelFingerPlugin.entelFingerPlugin sendResponseFingerDict:@"ERROR" callbackId:self.callbackId];
    }];
}

@end