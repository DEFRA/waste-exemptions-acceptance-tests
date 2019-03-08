# frozen_string_literal: true

Before("@email") do
  @email_app = EmailApp.new
  if @email_app.local?
    @email_app.mailcatcher_main_page.load
    @email_app.mailcatcher_main_page.clear_all_messages.click
    popup = page.driver.browser.switch_to.alert
    popup.accept
  end
end
