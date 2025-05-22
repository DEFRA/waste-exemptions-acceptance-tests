# frozen_string_literal: true

def back_office_root_url(path = "")
  File.join(@world.back_office_url, path)
end

def front_office_root_url(path = "")
  File.join(@world.front_office_url, path)
end

def check_for_accessibility
  step("the page should be axe clean according to: wcag21a, wcag21aa")
end

def remove_new_lines_from_text(address)
  address.split(/\n+/).join(", ")
end

def company?
  %i[limited_company llp].include?(@business_type)
end

def trim_comma(amount)
  amount.to_s.tr(",", "")
end

def next_year
  time = Time.new
  year = time.strftime "%y"
  year.to_i + 1
end

def trim_pound_sign(amount)
  amount.tr("£", "")
end

def strip_text_whitespace_convert_to_array(text)
  text.gsub(/\s+/, "")
  text.split(",")
end

def half_amount(amount)
  amount = amount.to_f
  amount / 2
end

def remove_pound_and_minus_sign(amount)
  amount.tr("£-", "")
end

def mocking_enabled?
  # Simple helper to check if mocking is currently enabled.
  # It is based on the fact that the mock gem uses URL constraints,
  # hence when we hit a mocking valid URL, if we receive a 404 response back,
  # we can assume that mocking is disabled
  uri = URI.parse(Quke::Quke.config.custom["urls"]["mock_enabled"])

  if ENV["WEX_PROXY"].nil?
    # using an instance variable so that we make the request to the mocking
    # endpoint only once
    @_mocking_enabled_response ||= Net::HTTP.get_response(uri)
  else
    # Adding proxy for http request
    proxy_uri = URI.parse(ENV["WEX_PROXY"])
    http = Net::HTTP.new(uri.hostname, uri.port, proxy_uri.host, proxy_uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true unless uri.to_s.include?("http://")
    @_mocking_enabled_response ||= http.request(request)
  end
  return false if @_mocking_enabled_response.to_s.include?("HTTPNotFound")

  true
end

# rubocop:disable Layout/LineLength
def visit_govpay_mock_payment_status_page(status)
  visit("#{Quke::Quke.config.custom['urls']['back_office']}/bo/mocks/govpay/v1/payments/set_test_payment_response_status/#{status}")
end

def visit_govpay_mock_refund_status_page(status)
  visit("#{Quke::Quke.config.custom['urls']['back_office']}/bo/mocks/govpay/v1/payments/set_test_refund_response_status/#{status}")
end
# rubocop:enable Layout/LineLength
