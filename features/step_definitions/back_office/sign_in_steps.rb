# frozen_string_literal: true

Given(/^I sign in as a system user$/) do
  login_user(@world.system_user)
end

Given(/^I sign in as a super agent$/) do
  login_user(@world.super_agent_user)
end

Given(/^I sign in as (?:a|an) admin agent$/) do
  login_user(@world.admin_agent_user)
end

Given(/^I sign in as (?:a|an) data agent$/) do
  login_user(@world.data_agent_user)
end
