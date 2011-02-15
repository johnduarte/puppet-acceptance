def run_the_tests(options, config)
  test_summary=[]
  options[:tests].each do |root|
    puts nil, '=' * 78, nil, "Running tests from #{root}"
    test_summary += run_tests_under(config, options, root)
  end
  test_summary
end

def run_tests_under(config, options, root)
  summary = []
  (Dir[File.join(root, "**/*.rb")] + [root]).select { |f| File.file?(f) }.each do |name|
    puts "", "", "#{name} executing..."
    result = TestWrapper.new(config,options,name).run_test
    puts "#{name} #{result.test_status}ed"
    summary << [name, result]
  end
  return summary
end
