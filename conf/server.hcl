server = true
bootstrap_expect = 3
enable_local_script_checks = true
client_addr = "127.0.0.1 {{ GetPrivateInterfaces | include \"network\" \"10.10.10.0/24\" | attr \"address\" }}"
