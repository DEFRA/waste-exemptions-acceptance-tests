After("@backoffice") do
  # As all our back office tests start with logging in we need to ensure that
  # as each back office scenario finishs that we have logged out. Rather than
  # peppering our steps with calls to click the log out link, we have this hook
  # which is called after every scenario tagged with @backoffice do it.
  @app.search_page.nav_bar.sign_out_link.click
end
