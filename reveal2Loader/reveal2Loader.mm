#line 1 "/Users/piao/Desktop/Reveal2Loader/reveal2Loader/reveal2Loader.xm"
#include <dlfcn.h>

static __attribute__((constructor)) void _logosLocalCtor_2ad1cba6(int __unused argc, char __unused **argv, char __unused **envp) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSDictionary *prefs = [[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.rheard.RHRevealLoader.plist"] retain];
    
    
    
    NSString *libraryPath = @"/usr/lib/RevealServer.framework/RevealServer";
    
    if([[prefs objectForKey:[NSString stringWithFormat:@"RHRevealEnabled-%@", [[NSBundle mainBundle] bundleIdentifier]]] boolValue]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:libraryPath]){
            void *handle = dlopen([libraryPath UTF8String], RTLD_NOW);
            if (!handle) {
                NSLog(@"dlopen() failed!!!");
                return;
            }
 
            [[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStart" object:nil];
            NSLog(@"Reveal2Loader loaded %@", libraryPath);
        }
    }
    
    [pool drain];
}
