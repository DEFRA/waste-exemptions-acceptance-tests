Before do
  # As of 2017-10-30 it appears that tests do not complete in our environments
  # if an element is not visible on the page. This should not be a problem and
  # cannot be replicated locally, however has been confirmed in our pre-prod
  # environment. The error we get is
  # Element is not clickable at point (592.5, 23).
  # The element in question is the continue (submit) button which on certain
  # pages using the default screen size is out of view.
  # Therefore we've added this functionality that looks for a custom
  # window_size element on the config object and if present, sets the window
  # size at the start of each test
  if Quke::Quke.config.custom && Quke::Quke.config.custom["window_size"]
    Capybara.current_session.current_window.resize_to(
      Quke::Quke.config.custom["window_size"]["width"],
      Quke::Quke.config.custom["window_size"]["height"]
    )
  end
end
