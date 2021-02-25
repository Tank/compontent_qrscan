#import "QrScanPlugin.h"

@implementation QrScanPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftQrScanPlugin registerWithRegistrar:registrar];
}
@end
