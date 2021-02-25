#import "QrScanPlugin.h"
#import <qrscan/qrscan-Swift.h>

@implementation QrScanPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftQrScanPlugin registerWithRegistrar:registrar];
}
@end
