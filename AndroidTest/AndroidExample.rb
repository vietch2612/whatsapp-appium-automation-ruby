require 'rubygems'
require 'test/unit'
require 'appium_lib'

class SettingsTest < Test::Unit::TestCase

  # Patch to your file
  APP_PATCH = '../Apk/com.whatsapp.app.apk'

  $driver = nil

  # Setup
  def setup
    caps = {
        caps: {
            platformName: 'Android',
            platformVersion: '5.0',
            deviceName: 'Android Emulator',
            app: APP_PATCH,
            name: 'Ruby Appium Android example'
        },
        appium_lib: {
            sauce_username: nil,
            sauce_access_key: nil
        }
    }
    driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    driver.start_driver.manage.timeouts.implicit_wait = 20 # seconds
  end

  # Quit driver after test
  def teardown
    driver_quit
  end

  def test_alert_popup
    find('com.whatsapp:id/alertTitle')
    find('android:id/button2').click
    puts 'Testing you'
  end

end