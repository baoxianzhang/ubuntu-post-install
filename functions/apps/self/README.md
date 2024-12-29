
# 记录一些测试记录

## 升级系统

```
sudo apt update
sudo apt upgrade
sudo do-release-upgrade -c
sudo do-release-upgrade 
```

这要求/boot的空间至少1G。

## ubuntu24.04按照搜狗拼音输入法

搜狗拼音需要fcitx4, 而且需要关闭WaylandEnable, 需要把下面这一行解注释。

```
WaylaneEnable=false
```


## ellama测试

symbol's function definition is void: json-parse-buffer

需要安装`apt-get install libjansson-dev`

emacs编译需要config

```
./configure --with-json --with-xml2

```
