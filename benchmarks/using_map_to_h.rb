require 'memory_profiler'
require 'active_support/all'

User = Struct.new(:id, :name)

target = (1..100_000).map do |i|
  User.new(i, "user#{i}")
end

report = MemoryProfiler.report do
  target.map do |t|
    [t, t]
  end.to_h
end

report.pretty_print
