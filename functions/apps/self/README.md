
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

## 翻墙

https://github.com/cfwtf/clash_for_windows/releases
https://archive.org/download/clash_for_windows_pkg

设置port
Ghelp 获得clash链接。

网络设置代理(或者setting->网络->代理）

```
export http_proxy="http://127.0.0.1:1080"
export https_proxy="http://127.0.0.1:1080"
export ALL_PROXY="socks5://127.0.0.1:1080"
```







