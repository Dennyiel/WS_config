$Product = Read-Host 'What is the name of your product ?'
$Project = Read-Host 'What is the name of your project ?'
$name = Read-Host 'What is your framework(Anuglar/React/DotNet) ?'
Write-Host "====================================="
$dir = Read-Host 'Place the path of the folder to be scanned'
Write-Host "=========Downloading Unified Agent Jar==============="
Invoke-WebRequest -URI https://unified-agent.s3.amazonaws.com/wss-unified-agent.jar -OutFile $dir\wss-unified-agent.jar
Write-Host ".........................................................................."
Write-Host "=========Completed Downloading Unified Agent Jar==============="
Write-Host "=========Downloading Unified Agent Configuration==============="
Invoke-WebRequest -URI https://github.com/Dennyiel/WS_config/blob/main/ws_$name.config -Outfile $dir\ws_$name.config
Write-Host ".........................................................................."
Write-Host "=========Completed Downloading Unified Agent Configuration==============="
Java -jar $dir\wss-unified-agent.jar -c $dir\ws_$name.config -d $dir -apikey $env:apikey -userkey $env:userkey -product $Product -project $Project -wss_url https://vmey.whitesourcesoftware.com/agent

#echo $env:apikey
#echo $env:userkey