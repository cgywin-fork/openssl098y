
# cygwin - openssl 0.9.8y 源码编译

openssl -v 0.9.8y 克隆。

**注意：**最好确保编译你的程序时，一定要用相同的gcc版本，比如不可用gcc4.8编译
openssl，然后用gcc3编译ruby去引用openssl。但是低版本gcc编译的openssl，
**有一定几率可以被高版本gcc编译的软件引用**（老娘就是那只瞎猫）。    

# openssl依赖
cygwin里openssl && openssl-devel有如下依赖：  
- openssl
  - bash
  - libopenssl?
  - perl
- openssl-devel
  - libopenssl?
  - zlib-devel  

在编译之前，确保依赖项可以工作，通过cygwin包管理或者源码编译都可以。

# checkout source code
openssl官方的ftp现在就是一坨，现在checkout openssl源码有以下方式（不止）：
- http://www.openssl.org/source/
- https://github.com/openssl/openssl
- 自己的镜像：）

# 构建步骤
写了一个脚本，在 [build_it.sh](build_it.sh) 里。  
```bash
./config --prefix=/usr/local/openssl98y --openssldir=/usr/local/openssl98y
make
make install
```
唯一要注意的是，如果不指定--openssldir，那么生成的配置文件和证书会在/usr/local/ssl下，
这样同时拥有不同版本openssl可能引起冲突。  
openssl不支持在目录之外，构建一个目录，然后../repo/config这样引用的，因为其.Configue
写的比较搓~~


### 结束
**这样我们就可以去构建那些只支持老版本openssl的软件了：）**