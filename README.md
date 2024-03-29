# 🐱 Linux Monitor

## 🚩 这个项目是什么？What is this project?

- 这是一个轻量级的 Linux 深度学习服务器性能监视器。

  This is a lightweight Linux deep learning server performance monitor.

- 它可以帮你监控：

  It can help you monitor:

  - `nvidia-smi` 命令下的显存占用。

    Memory usage under the `nvidia-smi` command.

  - CPU 在过去一分钟、五分钟、十五分钟的负载情况。

    CPU load in the last one minute, five minutes, and fifteen minutes.

  - `free -m` 命令下的内存占用与最高占用进程情况。

    Memory usage and the highest consuming process under the `free -m` command.

- 为你的 CVPR 保驾护航。

  Safeguarding your CVPR submission.

## 🚩 怎么使用？How to use?

你可以克隆这一仓库并直接执行：

You can clone this repository and execute directly:

```sh
git clone https://github.com/yusijin02/linux-monitor.git
watch -n 0.5 monitor.sh
```

你也可以直接下载这一脚本并直接执行：

You can also download this script directly and execute:

```sh
wget https://github.com/yusijin02/linux-monitor/monitor.sh
watch -n 0.5 monitor.sh
```

这里的 `0.5` 为刷新时间 (秒)，你可以根据你的需求客制化修改。

Here, `0.5` is the refresh time (seconds), which you can customize according to your needs.

## 🚩 其它  Others

🌟 欢迎收藏。Star this repository if you find it useful.

🌟 欢迎贡献。Welcome contributions.

⚠️ 只供非商业使用。 For non-commercial use only.
