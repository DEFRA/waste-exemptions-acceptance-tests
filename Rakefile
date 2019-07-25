# frozen_string_literal: true

task default: :run

desc "Run all scenarios (eq to bundle exec quke)"
task :run do
  sh %( bundle exec quke )
end

desc "Runs the tests used by continuous integration to check the project"
task :ci do
  sh %( QUKE_CONFIG=config/ci.config.yml bundle exec quke --tags @ci )
end

desc "Run @smoke tests against the local environment"
task :locs do
  sh %( QUKE_CONFIG=config/loc.config.yml bundle exec quke --tags @smoke)
end

desc "Run all tests against the local environment"
task :loc do
  sh %( QUKE_CONFIG=config/loc.config.yml bundle exec quke)
end

desc "Run tests with custom tags against the local environment"
task :loctag do
  sh %( QUKE_CONFIG=config/loc.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against the dev environment"
task :dev do
  sh %( QUKE_CONFIG=config/dev.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against the test environment"
task :tsts do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @smoke)
end

desc "Run all tests against the test environment"
task :tst do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke)
end

desc "Run tests against the test environment with custom tags"
task :tsttag do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @resume)
end

desc "Run all @wip tests against the test environment"
task :tstwip do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @wip)
end

desc "Run @smoke tests against the pre-production environment"
task :presmo do
  sh %( QUKE_CONFIG=config/pre.config.yml bundle exec quke --tags @smoke)
end

desc "Run all tests against the pre-production environment"
task :pre do
  sh %( QUKE_CONFIG=config/pre.config.yml bundle exec quke)
end

desc "Run tests against the pre-production environment with custom tags"
task :pretag do
  sh %( QUKE_CONFIG=config/pre.config.yml bundle exec quke --tags @broken)
end

desc "Run all tests against the production environment"
task :prd do
  sh %( QUKE_CONFIG=config/prd.config.yml bundle exec quke --tags ~@email)
end

desc "Run tests against the prod environment with custom tags"
task :prdtag do
  sh %( QUKE_CONFIG=config/prd.config.yml bundle exec quke --tags @wip)
end

desc "Run all browserstack tests"
task browserstack: %i[
  chrome70_osx
  chrome70_w10
  edge16_w10
  edge17_w10
  firefox63_osx
  firefox63_w10
  galaxy_note_8
  google_pixel
  ie11_w10
  iphone_8_plus
  iphone_xs
  safari12_osx
]

desc "Run @smoke tests against Chrome 70 OS X Mojave"
task :chrome70_osx do
  sh %( QUKE_CONFIG=config/browserstack/chrome70_osx.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against Chrome 70 Windows 10"
task :chrome70_w10 do
  sh %( QUKE_CONFIG=config/browserstack/chrome70_w10.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against Edge 16 Windows 10"
task :edge16_w10 do
  sh %( QUKE_CONFIG=config/browserstack/edge16_w10.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against Edge 17 Windows 10"
task :edge17_w10 do
  sh %( QUKE_CONFIG=config/browserstack/edge17_w10.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against Firefox 63 OS X Mojave"
task :firefox63_osx do
  sh %( QUKE_CONFIG=config/browserstack/firefox63_osx.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against Firefox 63 W10"
task :firefox63_w10 do
  sh %( QUKE_CONFIG=config/browserstack/firefox63_w10.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against Samsung Galaxy Note 8"
task :galaxy_note_8 do
  sh %( QUKE_CONFIG=config/browserstack/galaxy_note_8.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against Google Pixel 2"
task :google_pixel do
  sh %( QUKE_CONFIG=config/browserstack/google_pixel.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against Internet Explorer 11.0 Windows 10"
task :ie11_w10 do
  sh %( QUKE_CONFIG=config/browserstack/ie11_w10.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against iPhone 8 Plus"
task :iphone_8_plus do
  sh %( QUKE_CONFIG=config/browserstack/iphone_8_plus.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against iPhone XS"
task :iphone_xs do
  sh %( QUKE_CONFIG=config/browserstack/iphone_xs.config.yml bundle exec quke --tags @smoke)
end

desc "Run @smoke tests against Safari 12 OS X Mojave"
task :safari12_osx do
  sh %( QUKE_CONFIG=config/browserstack/safari12_osx.config.yml bundle exec quke --tags @smoke)
end
