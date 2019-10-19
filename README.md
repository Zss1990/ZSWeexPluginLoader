# ZSWeexPluginLoader

weex很多的插件库都使用了WeexPluginLoader这个库，但是该库代码不开源且不支持动态库，会导致很对的动态库冲突问题；这里我实现WeexPluginLoader功能了，可通过在Podfile文件中指向私有仓库源的形式替换对GitHub上的WeexPluginLoader依赖，weex提供的使用到WeexPluginLoader第三方插件库能正常使用。
## 只需要进行一下步骤：
- 1. 将ZSWeexPluginLoader.podspec改为name改为WeexPluginLoader.podspec，
- 2. 将WeexPluginLoader.podspec中的s.name改为WeexPluginLoader；
- 3. 将该库发布到自己的私有仓库。
- 4. 在Podfile文件中使用pod 'WeexPluginLoader', :source => 'http://git.xxxx/Specs' 方式指向自己的私有源，替换GitHub上的

## Author

shuaishuai, 

## License

ZSWeexPluginLoader is available under the MIT license. See the LICENSE file for more info.
