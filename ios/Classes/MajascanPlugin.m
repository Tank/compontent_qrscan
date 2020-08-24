#import "qrscanPlugin.h"
#import <qrscan/qrscan-Swift.h>

@implementation qrscanPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftqrscanPlugin registerWithRegistrar:registrar];
}
@end
