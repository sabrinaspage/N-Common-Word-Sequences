def time_decorator(func)
  start_time = Time.now
  func.call()
  end_time = Time.now
  puts "Time elapsed: #{end_time - start_time} seconds"
end