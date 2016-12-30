class BackOfficeHomePage < SitePrism::Page

  element(:menu_home, :xpath, "html/body/header/div/div/a[2]")
  element(:menu_registrations, :xpath, "html/body/header/div/nav/ul/li[1]/a")
  element(:menu_search, :xpath, "html/body/header/div/nav/ul/li[1]/ul/li[1]/a")
  element(:menu_new_registration, :xpath, "html/body/header/div/nav/ul/li[1]/ul/li[2]/a")
  element(:sign_out, :xpath, "html/body/header/div/nav/ul/li[3]/a")

  element(:search_field, "input[id='search']")
  element(:search_submitted, "#stage_submitted")
  element(:search_not_submitted, "#stage_not_submitted")
  element(:search_all, "#stage_all")
  element(:search_button, ".btn-success")

  element(:first_search_result, ".h4 > a:first-child")

  element(:alert_deregister_success, "div.alert-success[role='alert']", text: "Enrollment deregistered successfully")

  def search(args = {})
    puts @exemption_number
    search_field.set(args[@exemption_number]) if args.key?(@exemption_number)
    select_search(args[:type])

    search_button.click
  end

  def select_search(type)
    case type
    when :search_submitted
      search_submitted.click
    when :search_not_submitted
      search_not_submitted.click
    when :search_all
      search_all.click
    end
  end

end
