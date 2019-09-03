# frozen_string_literal: true

task default: :tst

desc "Run all scenarios (eq to bundle exec quke)"
task :run do
  sh %( bundle exec quke )
end

desc "Runs the tests used by continuous integration to check the project"
task :ci do
  sh %( QUKE_CONFIG=config/ci.config.yml bundle exec quke --tags @ci )
end

desc "Run all tests on local"
task :loc do
  sh %( QUKE_CONFIG=config/loc.config.yml bundle exec quke --tags "not @renew")
end

desc "Run custom tests on local"
task :loctag do
  sh %( QUKE_CONFIG=config/loc.config.yml bundle exec quke --tags @renew)
end

desc "Run all tests on test"
task :tst do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke)
end

desc "Run custom tests on test"
task :tsttag do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags "not @renew")
end

desc "Run @smoke tests against the pre-production environment"
task :presmo do
  sh %( QUKE_CONFIG=config/pre.config.yml bundle exec quke --tags @smoke)
end

desc "Run all tests against the pre-production environment"
task :pre do
  sh %( QUKE_CONFIG=config/pre.config.yml bundle exec quke --tags "not @renew")
end

desc "Run tests against the pre-production environment with custom tags"
task :pretag do
  sh %( QUKE_CONFIG=config/pre.config.yml bundle exec quke --tags @search)
end

# Individual tests on tst:

desc "Run @wip tests on test"
task :tst_wip do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @wip)
end

desc "Run back office registration on test"
task :tst_regb do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @regb)
end

desc "Run deregistration on test"
task :tst_deregister do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @deregister)
end

desc "Run edit on test"
task :tst_edit do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @edit)
end

desc "Run back and front office renewal tests on test"
task :tst_renew do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @renew)
end

desc "Run resume on test"
task :tst_resume do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @resume)
end

desc "Run search on test"
task :tst_search do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @search)
end

desc "Run system admin tests on test"
task :tst_system do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @system)
end

desc "Run front office registration on test"
task :tst_reg do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @reg)
end

desc "Run location on test"
task :tst_regb do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @location)
end

desc "Run front office tests on test"
task :tst_frontoffice do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke --tags @frontoffice)
end

# Cross browser testing

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
