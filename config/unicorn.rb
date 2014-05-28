working_directory "/home/zhangw/Test_gem"
pid "/home/zhangw/Test_gem" + "/tmp/pids/unicorn.pid"
stderr_path "/home/zhangw/Test_gem" + "/log/unicorn.log"
stdout_path "/home/zhangw/Test_gem" + "/log/unicorn.log"

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

#bundle exec unicorn -E production -Dc config/unicorn.rb