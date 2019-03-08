# frozen_string_literal: true

Given(/^I sign in as a system user$/) do
  @app = App.new
  @app.login_page.load
  # Back office login page
  @app.login_page.submit(
    email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username"],
    password: ENV["WEX_DEFAULT_PASSWORD"]
  )
end

Given(/^I sign in as a super agent$/) do
  @app = App.new
  @app.login_page.load
  # Back office login page
  @app.login_page.submit(
    email: Quke::Quke.config.custom["accounts"]["SuperAgent"]["username"],
    password: ENV["WEX_DEFAULT_PASSWORD"]
  )
end

Given(/^I sign in as (?:a|an) admin agent$/) do
  @app = App.new
  @app.login_page.load
  # Back office login page
  @app.login_page.submit(
    email: Quke::Quke.config.custom["accounts"]["AdminAgent"]["username"],
    password: ENV["WEX_DEFAULT_PASSWORD"]
  )
end

Given(/^I sign in as a data agent$/) do
  @app = App.new
  @app.login_page.load
  # Back office login page
  @app.login_page.submit(
    email: Quke::Quke.config.custom["accounts"]["DataAgent"]["username"],
    password: ENV["WEX_DEFAULT_PASSWORD"]
  )
end
