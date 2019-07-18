server = true
enable_local_script_checks = true
client_addr = "127.0.0.1 {{ GetPrivateInterfaces | sort \"default\" | join \"address\" \" \"  }}"
ui = true
