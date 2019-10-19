//
//  WPLMacro.h
//  ZSWeexPluginLoader
//
//  Created by shuaishuai on 2019/10/19.
//

#ifndef WPLMacro_h
#define WPLMacro_h


#ifndef WeexPluginSectName
#define WeexPluginSectName "ZSWeexPlugins"
#endif

#ifndef WXModulePluginName
#define WXModulePluginName @"ZSWXModules"
#endif

#ifndef WXComponentPluginName
#define WXComponentPluginName @"ZSWXComponents"
#endif

#ifndef WXHandlerPluginName
#define WXHandlerPluginName @"ZSWXHandlers"
#endif

#define WX_DATA(sectname) __attribute((used, section("__DATA,"#sectname" ")))
//#define SWeexPluginDATA SWX_DATA(SweetWeexPlugins);
#define WeexPluginDATA __attribute((used, section("__DATA,ZSWeexPlugins")))

#define WX_PLUGIN_NAME_SEPARATOR(module,jsname,classname,separator) module#separator#jsname#separator#classname

#define WX_PLUGIN_NAME(module,jsname,classname) WX_PLUGIN_NAME_SEPARATOR(module,jsname,classname,&)

#define WX_PlUGIN_EXPORT_MODULE_DATA(jsname,classname) \
char const * k##classname##Configuration WeexPluginDATA = WX_PLUGIN_NAME("ZSWXModules",jsname,classname);

#define  WX_PlUGIN_EXPORT_COMPONENT_DATA(jsname,classname)\
char const * k##classname##Configuration WeexPluginDATA = WX_PLUGIN_NAME("ZSWXComponents",jsname,classname);

#define WX_PlUGIN_EXPORT_HANDLER_DATA(jsimpl,jsprotocolname)\
char const * k##jsimpl##jsprotocolname##Configuration WeexPluginDATA = WX_PLUGIN_NAME("ZSWXHandlers",jsimpl,jsprotocolname);




#endif /* WPLMacro_h */
