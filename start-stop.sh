#!/bin/bash

# Java 应用程序的启动参数
APP_OPTS="-Xmx64m -Djava.awt.headless=true"

# Java 应用程序的 classpath
APP_CLASSPATH="target/practice-0.0.1-SNAPSHOT.jar"

# 获取 Java 进程 ID
get_pid() {
  pid=$(jps -l | grep $APP_CLASSPATH | awk '{print $1}')
  echo $pid
}

# 停止 Java 进程
stop() {
  pid=$(get_pid)
  if [ -n "$pid" ]; then
    echo "Stopping Java process $pid..."
    if [[ "$OS" == "Windows_NT" ]]; then 
      tskill  $pid
    else
      kill $pid
    fi
    sleep 5
    if [ -n "$(get_pid)" ]; then
      echo "Failed to stop Java process $pid"
      exit 1
    else
      echo "Java process $pid stopped"
    fi
  else
    echo "Java process is not running"
  fi
}

# 启动 Java 进程
start() {
  pid=$(get_pid)
  if [ -n "$pid" ]; then
    echo "Java process is already running with PID $pid"
    exit 1
  fi
  echo "mvn clean package..."
  mvn clean package
  echo "Starting Java process..."
  nohup java $APP_OPTS -jar $APP_CLASSPATH > log/output.log 2>&1 &
  sleep 5
  pid=$(get_pid)
  if [ -z "$pid" ]; then
    echo "Failed to start Java process"
    exit 1
  else
    echo "Java process started with PID $pid"
  fi
}

# 根据命令行参数执行相应的操作
case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
    ;;
esac