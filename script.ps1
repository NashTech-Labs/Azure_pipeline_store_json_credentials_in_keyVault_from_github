#converting the from the json present on git repo
$response = Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Balraj0017/ADO_cred/main/test.json' -UseBasicParsing
$response = $response | ConvertFrom-Json 

$secretvalue = ConvertTo-SecureString $response.SecretKey -AsPlainText -Force
$ApplicationName = $response.ApplicationName -Replace '\.',''
Set-AzKeyVaultSecret -VaultName "demo1cred" -Name $ApplicationName -SecretValue $secretvalue

#reading the secret
Get-AzKeyVaultSecret -VaultName "demo1cred" -Name $ApplicationName -AsPlainText
