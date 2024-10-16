# 使用 tar 打包文件夹并通过 pigz 并行压缩，输出为 .tgz 文件
# -9 表示最大压缩，-p 20 表示使用 20 个线程
tar -cvf - case2 | pigz -9 -p 20 > case2.tgz
