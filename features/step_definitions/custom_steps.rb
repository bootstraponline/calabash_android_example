$:.unshift File.dirname __FILE__
require 'wait_for_activity'

Given /^I'm on (.+)$/ do |activity|
  wait_for_activity activity
end

Then /^I enter my "(.+)" username$/ do |username|
  wait_for_activity 'LoginActivity'
  query "AutoCompleteTextView id:'et_login'", setText: username
end

Then /^I enter my "(.+)" password$/ do |password|
  wait_for_activity 'LoginActivity'
  query "EditText id:'et_password'", setText: password
end

When /^I touch (.+)$/ do |button|
  m = { login: "ActionMenuItemView id:'m_login'",
        username: "TextView id:'tv_org_name' index:0",
        gists: "TextView id:'tv_org_name' text:'Gists'",
        issues: "TextView id:'tv_org_name' text:'Issue Dashboard'",
        bookmarks: "TextView id:'tv_org_name' text:'Bookmarks'"
      }

  touch m[button.to_sym]
end
