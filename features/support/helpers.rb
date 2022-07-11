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

def remove_new_lines_from_address(address)
  address.split(/\n+/).join(", ")
end

def company?
  %i[limited_company llp].include?(@business_type)
end
