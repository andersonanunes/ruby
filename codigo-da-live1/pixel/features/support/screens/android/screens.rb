
class Home
  def go_account
    find_element(id: "qaninja.com.pixel:id/accountButt").click
  end
end

class Login
  def with(email, pass)
    find_element(id: "qaninja.com.pixel:id/usernameTxt").send_keys(email)
    find_element(id: "qaninja.com.pixel:id/passwordTxt").send_keys(pass)
    find_element(id: "qaninja.com.pixel:id/loginButt").click
  end

  def popup
    find_element(id: "android:id/message")
  end
end

class MyAccount
  def view
    find_element(id: "qaninja.com.pixel:id/account")
  end
end
