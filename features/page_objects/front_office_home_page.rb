class FrontOfficeHomePage < SitePrism::Page

 set_url('/')

 element(:submit_button, "input[name='commit']")

end