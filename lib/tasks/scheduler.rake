desc "Run all jobs then exit"
task :process_queue => :environment do
  puts "Starting Cheap Worker..."
  free_labour = Delayed::Worker.new
  results = free_labour.work_off 100 
  puts "#{results[0]} jobs completed, #{results[1]} jobs failed"
end