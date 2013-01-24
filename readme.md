Simple calabash-android example.

- [GitHub for Android](https://github.com/github/android)
- [wait_for_activity](https://gist.github.com/4589830)
- Clear app data is used in app_installation_hooks.rb

```
export RESET_BETWEEN_SCENARIOS=1
export SCREENSHOT_VIA_USB=true
```

`calabash-android resign com.github.mobile_1.6.1.apk`

`calabash-android run com.github.mobile_1.6.1.apk`

Requires at least calabash-android 0.4.0pre10 and Ruby 1.8 (1.9 recommended). You must replace USERNAME and PASSWORD in navigation.feature to run the tests. I suggest using a temporary account with no repositories.
