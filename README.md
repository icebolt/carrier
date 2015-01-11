# carrier
centos docker in docker


在boot2docker v1.3.0执行:

    docker run --privileged -i -t -v /lib/modules/3.16.4-tinycore64/:/lib/modules/3.16.4-tinycore64/ carrier /bin/bash

启动docker carrier

进入docker carrier,运行：

    docker run -i -t -v /bin:/MM/bin -v /usr/bin/:/MM/usr/bin -v /lib64:/MM/lib64 -v /usr/lib64:/MM/usr/lib64 ubuntu /bin/bash

在新启动的实例里，设置环境变量

    export LD_LIBRARY_PATH=/lib/x86_64-linux-gnu:/lib:/lib64:/MM/lib64/:/MM/usr/lib64/
    exprot PATH=/bin:/usr/bin:/MM/bin/:/MM/usr/bin/:$PATH

后，不需安装可以直接使用docker carrier上面的命令.
