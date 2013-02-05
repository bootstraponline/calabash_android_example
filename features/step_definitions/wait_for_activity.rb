require 'retriable'
require 'calabash-android/operations' # for default_device.adb_command
# https://gist.github.com/4589830

def focused_activity
  `#{default_device.adb_command} shell dumpsys window windows`.each_line.grep(/mFocusedApp.+[\.\/]([^.\/\}]+)}/){$1}.first
end

def wait_for_activity activity
  retriable :tries => 15, :interval => 1 do
    focused = focused_activity
    raise "Activity #{activity} not found. Current activity is #{focused}" if focused != activity
  end
end

def touch_wait query
  # Wrap single query in array
  query = [query] unless query.class == Array

  wait_for(15) do
    result = false
    # Process multiple queries
    # ["TextView", "ActionBarContainer"]
    query.each do |q|
      begin
        # No elements found (RuntimeError)
        result = touch(q)
        result = result ? result['success'] == true : false
        break if result
      rescue
      end
    end

    result
  end
end

def query_wait_set_text query, text
  wait_for(15) do
    set = query(query, :setText => text).count > 0
    get = query(query, :getText)
    get = get.count > 0 ? get[0] == text : false

    set && get
  end
end
