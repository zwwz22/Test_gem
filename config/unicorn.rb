working_directory "/home/zhangw/Test_gem"
pid "/home/zhangw/Test_gem" + "/tmp/pids/unicorn.pid"
stderr_path "/home/zhangw/Test_gem" + "/log/unicorn.log"
stdout_path "/home/zhangw/Test_gem" + "/log/unicorn.log"

listen "/tmp/unicorn.sock"
worker_processes 2
timeout 30
#hot restart
before_fork do |server, worker|
  old_pid = Rails.root + '/tmp/pids/unicorn.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      p  'someone else did our job for us'
    end
  end
end
#working_directory "/alidata1/xiyou/apps/toyouface/current"
#pid "/alidata1/xiyou/apps/toyouface/current" + "/tmp/pids/unicorn.pid"
#stderr_path "/alidata1/xiyou/apps/toyouface/current" + "/log/unicorn.log"
#stdout_path "/alidata1/xiyou/apps/toyouface/current" + "/log/unicorn.log"
#
#listen "/tmp/unicorn.toyouface.sock"
#worker_processes 2
#timeout 30

#bundle exec unicorn -E production -Dc config/unicorn.rb