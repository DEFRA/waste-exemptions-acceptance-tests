# frozen_string_literal: true

# Because of the way Cucumber is put together with everything loaded in the
# global namespace and no main() method to speak of, there doesn't seem to be
# any better way of persisting state between runs.
# rubocop:disable Style/GlobalVars
Before do
  $world_state ||= World.new
  @world = $world_state
end

Before("@data") do
  # We use this before hook to generate some registrations so that scenarios
  # that rely on there being some existing data don't have create them as part
  # of their tests. For example we have multiple scenarios that involve
  # searching for a registration. Without this hook to support running them
  # independently each one would have to create the registrations it needs. Now
  # we can create them once here saving time and effort in the tests themselves.
  $prepped_data ||= false

  unless $prepped_data
    prepopulate_registrations
    @world.known_bo_user_email = generate_example_email(nil, nil)
    login_user(@world.system_user)
    create_user(:admin_agent, @world.known_bo_user_email)
    # Clears session otherwise any scenario which attempts to login first would
    # fail as we are already logged in.
    Capybara.reset_session!
  end

  $prepped_data = true
end

# rubocop:enable Style/GlobalVars
