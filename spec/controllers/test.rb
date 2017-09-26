RSpec.configure do |config|
  config.before(:suite) do
    puts "before suite"
  end

  config.before(:all) do
    puts "before all"
  end

  config.before(:each) do
    puts "before each"
  end

  config.after(:each) do
    puts "after each"
  end

  config.after(:all) do
    puts "after all"
  end

  config.after(:suite) do
    puts "after suite"
  end
end

describe "ignore" do
  example "ignore" do
  end
end