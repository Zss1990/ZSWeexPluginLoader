//
//  WeexPluginLoader.h
//  ZSWeexPluginLoader
//
//  Created by shuaishuai on 2019/10/19.
//

#import "WPLMacro.h"
#import "WPLRegister.h"

#ifndef WeexPluginLoader_h
#define WeexPluginLoader_h

/**
 * this macro is used to auto regester moudule.
 *  example: WX_PlUGIN_EXPORT_MODULE(test,WXTestModule)
 **/
#define WX_PlUGIN_EXPORT_MODULE(jsname,classname) WX_PlUGIN_EXPORT_MODULE_DATA(jsname,classname)

/**
 *  this macro is used to auto regester component.
 *  example:WX_PlUGIN_EXPORT_COMPONENT(test,WXTestCompnonent)
 **/
#define WX_PlUGIN_EXPORT_COMPONENT(jsname,classname) WX_PlUGIN_EXPORT_COMPONENT_DATA(jsname,classname)

/**
 *  this macro is used to auto regester handler.
 *  example:WX_PlUGIN_EXPORT_HANDLER(WXImgLoaderDefaultImpl,WXImgLoaderProtocol)
 **/
#define WX_PlUGIN_EXPORT_HANDLER(jsimpl,jsprotocolname) WX_PlUGIN_EXPORT_HANDLER_DATA(jsimpl,jsprotocolname)


#endif /* WeexPluginLoader_h */
