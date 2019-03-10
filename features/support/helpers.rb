# frozen_string_literal: true

def back_office_root_url(path = "")
  File.join(@world.back_office_url, path)
end

def front_office_root_url(path = "")
  File.join(@world.front_office_url, path)
end
