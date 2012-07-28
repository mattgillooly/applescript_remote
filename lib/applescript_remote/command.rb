module ApplescriptRemote

  class Command

    def initialize(applescript)
      @applescript = applescript
    end

    def execute
      log "Executing: #{@applescript}"

      result = AppleScript.execute(@applescript)
      log "Got result: #{result}"

      result

    rescue AppleScriptError => ex
      log("Got AppleScriptError: #{ex.message}")

      ex.message
    end

    def log(s)
      # TODO: real logging
      puts s
    end

  end

end