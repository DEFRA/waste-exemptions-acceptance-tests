# frozen_string_literal: true

# Represents all pages in the front office. Was created to avoid needing to
# create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
class EmailApp
  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page

  def last_email_api_page
    @last_page = LastEmailApiPage.new
  end

  def last_notify_msg_page
    @last_page = LastNotifyMsgPage.new
  end

end
