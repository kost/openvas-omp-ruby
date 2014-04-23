#!/usr/bin/env ruby

require_relative "./common"
require_relative '../lib/openvas-omp'

ov = OpenVASOMP::OpenVASOMP.new("user"=>USER,"password"=>PASS,"host"=>URI,"debug"=>0)

puts "Openvas Version #{ov.version_get}"

targets = ov.target_get_all
puts "\nTargets:"
targets.each { |k,v| puts "#{k} => #{v}"}

tasks = ov.task_get_all
puts "\nTasks"
puts tasks

configs = ov.config_get_all
puts "\nConfigs"
puts configs



formats = ov.format_get_all
puts "\nFormats"
puts formats

x = 'HTML'
puts "\nID for #{x} is #{ov.format_get_by_name(x)}"
x = 'NBE'
puts "\nID for #{x} is #{ov.format_get_by_name(x)}"


reports = ov.report_get_all
puts "\nReports"
puts reports

x = (reports.first)['id']

content=ov.report_get_byid(x,'HTML')
File.open('reports/report.html', 'w') {|f| f.write(content) }

content=ov.report_get_byid(x,'XML')
File.open('reports/report.xml', 'w') {|f| f.write(content) }

content=ov.report_get_byid(x,'ARF')
File.open('reports/report_arf.xml', 'w') {|f| f.write(content) }

content=ov.report_get_byid(x,'CPE')
File.open('reports/report_cpe.csv','w') {|f| f.write(content) }

content=ov.report_get_byid(x,'NBE')
File.open('reports/report_nbe.txt','w') {|f| f.write(content) }

content=ov.report_get_byid(x,'TXT')
File.open('reports/report_txt.txt','w') {|f| f.write(content) }

content=ov.report_get_byid(x,'LaTeX')
File.open('reports/report.tex','w') {|f| f.write(content) }
