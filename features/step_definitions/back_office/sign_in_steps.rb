# frozen_string_literal: true

Given(/^I sign in as (?:a|an) admin team user$/) do
  login_user(@world.admin_team_user)
end

Given(/^I sign in as (?:a|an) admin team leader$/) do
  login_user(@world.admin_team_leader)
end

Given("I sign in as a data viewer user") do
  login_user(@world.data_viewer_user)
end

Given("I sign in as a developer") do
  login_user(@world.developer_user)
end

Given("I sign in as a service manager") do
  login_user(@world.service_manager)
end

Given("I sign in as a finance user") do
  login_user(@world.finance_user)
end

Given("I sign in as a policy adviser") do
  login_user(@world.policy_adviser_user)
end
