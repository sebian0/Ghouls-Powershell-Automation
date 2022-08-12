$webConfigPath = "Enter full web config path (ex. D:\Webs\<app>\web.config)"
$xml = [xml](Get-Content $webConfigPath)

## Replace keys and values in $Dictionary params below with the keys you want to## update and the corresponding NEW values.
## copy and paste <key> = '<value>' for each key you need to update if needed.

$Dictionary = @{
	<key> = '<value>'
	<key> = '<value>'
}

foreach ($key in $Dictionary.Keys)
{
	Write-Host "Locating Key $key..."
	if(($addKey = $xml.SelectSingleNode("//appSettings/add[@key = '$key']")))
	{
		Write-Host "Found key: '$key'... updating value to $($Dictionary[$key])"
		$addkey.SetAttribute('value',$Dictionary[$key])
	}
	}
	xml.Save($webConfigPath)

