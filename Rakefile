# frozen_string_literal: true

task default: :run

desc "Run all scenarios (eq to bundle exec quke)"
task :run do
  sh %( bundle exec quke )
end

desc "Runs the tests used by continuous integration to check the project"
task :ci do
  sh %( QUKE_CONFIG=.config-ci.yml bundle exec quke --tags @ci )
end

desc "Run @smoke tests against the local environment"
task :loc do
  sh %( QUKE_CONFIG=config/.config.loc.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against the dev environment"
task :dev do
  sh %( QUKE_CONFIG=config/.config.dev.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against the test environment"
task :tst do
  sh %( QUKE_CONFIG=config/.config.tst.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against the pre-production environment"
task :pre do
  sh %( QUKE_CONFIG=config/.config.pre.yml bundle exec quke --tags @smoke)
end

desc "Run all browserstack tests"
task browserstack: %i[ie11_W10 Chrome70_W10 Chrome70_OSX Firefox63_OSX Google_Pixel Edge16_W10 Edge17_W10 Firefox63_W10]
# Safari12_OSX iPhone_8
# Taking out due to local Safari OS X12 issue https://www.browserstack.com/question/664

desc "Run Internet explorer 11.0 Windows 10 test"
task :ie11_W10 do
  sh %( QUKE_CONFIG=config/browserstack.config_ie11_W10.yml bundle exec quke --tags @smoke)
end

desc "Run Edge 16 Windows 10 test"
task :Edge16_W10  do
  sh %( QUKE_CONFIG=config/browserstack.config_Edge16_W10.yml bundle exec quke --tags @smoke)
end

desc "Run Edge 17 Windows 10 test"
task :Edge17_W10 do
  sh %( QUKE_CONFIG=config/browserstack.config_Edge17_W10.yml bundle exec quke --tags @smoke)
end

desc "Run Chrome 70 Windows 10 test"
task :Chrome70_W10 do
  sh %( QUKE_CONFIG=config/browserstack.config_Chrome70_W10.yml bundle exec quke --tags @smoke)
end

desc "Run Firefox 63 W10 test"
task :Firefox63_W10  do
  sh %( QUKE_CONFIG=config/browserstack.config_Firefox63_W10.yml bundle exec quke --tags @smoke)
end

desc "Run Safari 12 OS X Mojave test"
task :Safari12_OSX  do
  sh %( QUKE_CONFIG=config/browserstack.config_Safari12_OSX.yml bundle exec quke --tags @smoke)
end

desc "Run Chrome 70 OS X Mojave test"
task :Chrome70_OSX  do
  sh %( QUKE_CONFIG=config/browserstack.config_Chrome70_OSX.yml bundle exec quke --tags @smoke)
end

desc "Run Firefox 63 OS X Mojave test"
task :Firefox63_OSX  do
  sh %( QUKE_CONFIG=config/browserstack.config_Firefox63_OSX.yml bundle exec quke --tags @smoke)
end

desc "Run iPhone XS test"
task :iPhone_XS do
  sh %( QUKE_CONFIG=config/browserstack.config_iPhone_XS.yml bundle exec quke --tags @smoke)
end

desc "Run iPhone 8 plus test"
task :iPhone_8 do
  sh %( QUKE_CONFIG=config/browserstack.config_iPhone_8.yml bundle exec quke --tags @smoke)
end

desc "Run Samsung Galaxy Note 8 test"
task :Galaxy_Note_8 do
  sh %( QUKE_CONFIG=config/browserstack.config_Galaxy_Note_8.yml bundle exec quke --tags @smoke)
end

desc "Run Google Pixel 2 test"
task :Google_Pixel do
  sh %( QUKE_CONFIG=config/browserstack.config_Google_Pixel.yml bundle exec quke --tags @smoke)
end
