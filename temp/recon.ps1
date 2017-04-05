$ip = Invoke-RestMethod http://ipinfo.io/json | Select -exp ip
