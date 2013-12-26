working_directory "/home/zhangw/ttt/current"
pid "/home/zhangw/ttt" + "/tmp/pids/unicorn.pid"
stderr_path "/home/zhangw/ttt/current" + "/log/unicorn.log"
stdout_path "/home/zhangw/ttt/current" + "/log/unicorn.log"

listen "/tmp/unicorn.sock"
worker_processes 2
timeout 30
#working_directory "/alidata1/xiyou/apps/toyouface/current"
#pid "/alidata1/xiyou/apps/toyouface/current" + "/tmp/pids/unicorn.pid"
#stderr_path "/alidata1/xiyou/apps/toyouface/current" + "/log/unicorn.log"
#stdout_path "/alidata1/xiyou/apps/toyouface/current" + "/log/unicorn.log"
#
#listen "/tmp/unicorn.toyouface.sock"
#worker_processes 2
#timeout 30