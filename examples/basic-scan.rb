#!/usr/bin/env ruby

require_relative '../lib/openvas-omp'
require_relative "./common"

ov = OpenVASOMP::OpenVASOMP.new(:user=>USER, :password =>PASS, :host =>HOST, :debug=>0)

config = ov.config_get().key("Full and fast")
puts "Config: #{config}"

target = ov.target_create({"name"=>"t2", "hosts"=>"127.0.0.1", "comment"=>"t"})
puts "Target: #{target}"

taskid = ov.task_create({"name"=>"t2","comment"=>"t", "target"=>target, "config"=>config})
puts "Taskid: #{taskid}"

ov.task_start(taskid)
while not ov.task_finished(taskid) do
        stat=ov.task_get_byid(taskid)
        puts "Status: #{stat['status']}, Progress: #{stat['progress']} %"
        sleep 10
end
stat=ov.task_get_byid(taskid)

# this is broken in version 4
# content=ov.report_get_byid(stat["lastreport"],'HTML')
# File.open('report.html', 'w') {|f| f.write(content) }

