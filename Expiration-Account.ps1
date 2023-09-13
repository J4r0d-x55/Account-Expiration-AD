Import-Module ActiveDirectory

$joursAvantExpiration = 7

$dateActuelle = Get-Date

$dateLimiteExpiration = $dateActuelle.AddDays($joursAvantExpiration)

$comptesExpire = Get-ADUser -Filter {AccountExpirationDate -lt $dateLimiteExpiration} -Properties SamAccountName, AccountExpirationDate

foreach ($compte in $comptesExpire) {
    Write-Host "Compte expiré : $($compte.SamAccountName) - Date d'expiration : $($compte.AccountExpirationDate)"
}