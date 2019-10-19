//
//  ZSWXAnnotation.m
//  ZSWeexPluginLoader
//
//  Created by shuaishuai on 2019/10/19.
//

#import "ZSWXAnnotation.h"
#import <WeexSDK/WXSDKEngine.h>
#include <mach-o/getsect.h>
#include <mach-o/loader.h>
#include <mach-o/dyld.h>
#include <dlfcn.h>
#import <objc/runtime.h>
#import <objc/message.h>
#include <mach-o/ldsyms.h>
#import "WPLMacro.h"

NSArray<NSString *>* WXReadConfiguration(char *sectionName,const struct mach_header *mhp);

static void zswx_dyld_callback(const struct mach_header *mhp, intptr_t vmaddr_slide)
{
    /*
     Printing description of configs:
     <__NSArrayM 0x600001580690>(
     module&sw/router&SWWXRouterPlugin,
     protocol&WXImgLoaderDefaultImpl&WXImgLoaderProtocol
     )
     */
    NSArray<NSString *> *modules = WXReadConfiguration(WeexPluginSectName,mhp);
    if (modules.count > 0) {
    }
    for (NSString *map in modules) {
        NSArray *subList = [map componentsSeparatedByString:@"&"];
        if (subList.count >= 3) {
            NSString *pluginTp = [subList objectAtIndex:0];
            NSString *jsName = [subList objectAtIndex:1];
            NSString *clsName = [subList objectAtIndex:2];
            
            if ([pluginTp isEqualToString:WXModulePluginName]) {
                if (jsName && clsName) {
                    [WXSDKEngine registerModule:jsName withClass:NSClassFromString(clsName)];
                }
            }
            
            if ([pluginTp isEqualToString:WXComponentPluginName]) {
                if (jsName && clsName) {
                    [WXSDKEngine registerComponent:jsName withClass:NSClassFromString(clsName)];
                }
            }
            
            if ([pluginTp isEqualToString:WXHandlerPluginName]) {
                NSString *jsimpl = jsName;
                NSString *jsprotocolname  = clsName;
                if (jsimpl && jsprotocolname) {
                    id handler = [NSClassFromString(jsimpl) new];
                    if (handler) {
                        [WXSDKEngine registerHandler:handler withProtocol:NSProtocolFromString(jsprotocolname)];
                    }
                }
                
            }
        }
    }
}

__attribute__((constructor))
void initProphet() {
    //    NSLog(@"---> initProphet");
    _dyld_register_func_for_add_image(zswx_dyld_callback);
}

NSArray<NSString *>* WXReadConfiguration(char *sectionName,const struct mach_header *mhp)
{
    NSMutableArray *configs = [NSMutableArray array];
    unsigned long size = 0;
#ifndef __LP64__
    uintptr_t *memory = (uintptr_t*)getsectiondata(mhp, SEG_DATA, sectionName, &size);
#else
    const struct mach_header_64 *mhp64 = (const struct mach_header_64 *)mhp;
    uintptr_t *memory = (uintptr_t*)getsectiondata(mhp64, SEG_DATA, sectionName, &size);
#endif
    
    unsigned long counter = size/sizeof(void*);
    for(int idx = 0; idx < counter; ++idx){
        char *string = (char*)memory[idx];
        NSString *str = [NSString stringWithUTF8String:string];
        if(!str)continue;
        if(str) [configs addObject:str];
    }
    
    return configs;
}

@implementation ZSWXAnnotation

@end
