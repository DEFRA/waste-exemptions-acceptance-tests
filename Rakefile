# frozen_string_literal: true

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: :run

# Remember to create an environment variable in Travis (can be set to anything)!
if ENV["TRAVIS"]
  # Setting the default is additive. So if we didn't add the following line
  # :default would now run both all tests and rubocop
  Rake::Task[:default].clear
  task default: [:ci]
end

desc "Run all scenarios (eq to bundle exec quke)"
task :run do
  sh %( bundle exec quke )
end

desc "Runs the tests used by continuous integration to check the project"
task :ci do
  Rake::Task["rubocop"].invoke
  sh %( QUKE_CONFIG=.config-ci.yml bundle exec quke --tags @ci )
end
desc "Run all browserstack tests"
task browserstack: %i[ie11_W10 Chrome70_W10 Chrome70_OSX Firefox63_OSX Google_Pixel Edge16_W10 Edge17_W10 Firefox63_W10 ]
# Safari12_OSX iPhone_8
# Taking out due to local Safari OS X12 issue https://www.browserstack.com/question/664

desc "Run Internet explorer 11.0 Windows 10 test"
task :ie11_W10 do
  sh %( QUKE_CONFIG=.config_ie11_W10.yml bundle exec quke --tags @smoke)
end

desc "Run Edge 16 Windows 10 test"
task :Edge16_W10  do
  sh %( QUKE_CONFIG=.config_Edge16_W10.yml bundle exec quke --tags @smoke)
end

desc "Run Edge 17 Windows 10 test"
task :Edge17_W10 do
  sh %( QUKE_CONFIG=.config_Edge17_W10.yml bundle exec quke --tags @smoke)
end

desc "Run Chrome 70 Windows 10 test"
task :Chrome70_W10 do
  sh %( QUKE_CONFIG=.config_Chrome70_W10.yml bundle exec quke --tags @smoke)
end

desc "Run Firefox 63 W10 test"
task :Firefox63_W10  do
  sh %( QUKE_CONFIG=.config_Firefox63_W10.yml bundle exec quke --tags @smoke)
end

desc "Run Safari 12 OS X Mojave test"
task :Safari12_OSX  do
  sh %( QUKE_CONFIG=.config_Safari12_OSX.yml bundle exec quke --tags @smoke)
end

desc "Run Chrome 70 OS X Mojave test"
task :Chrome70_OSX  do
  sh %( QUKE_CONFIG=.config_Chrome70_OSX.yml bundle exec quke --tags @smoke)
end

desc "Run Firefox 63 OS X Mojave test"
task :Firefox63_OSX  do
  sh %( QUKE_CONFIG=.config_Firefox63_OSX.yml bundle exec quke --tags @smoke)
end

desc "Run iPhone XS test"
task :iPhone_XS do
  sh %( QUKE_CONFIG=.config_iPhone_XS.yml bundle exec quke --tags @smoke)
end

desc "Run iPhone 8 plus test"
task :iPhone_8 do
  sh %( QUKE_CONFIG=.config_iPhone_8.yml bundle exec quke --tags @smoke)
end

desc "Run Samsung Galaxy Note 8 test"
task :Galaxy_Note_8 do
  sh %( QUKE_CONFIG=.config_Galaxy_Note_8.yml bundle exec quke --tags @smoke)
end

desc "Run Google Pixel 2 test"
task :Google_Pixel do
  sh %( QUKE_CONFIG=.config_Google_Pixel.yml bundle exec quke --tags @smoke)
end
