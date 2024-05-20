#Q.2.2
# Modification du chemin d'acces au fichier AddLocalUsers.ps1 

Start-Process -FilePath "powershell.exe" -ArgumentList "C:\Scripts\AddLocalUsers.ps1" -Verb RunAs -WindowStyle Maximized

#Q.2.3
# L'option -Verb RunAs sert à lancer le script en Administrateur

#Q.2.4

#L'option -WindowStyle Maximized sert à lancer powershell dans une grande fenêtre

#Q.2.5

# Le premier utilisateur n'est pas pris en compte à cause du -SelectObject -skip2

#Q.2.6

# Le champs Description n'est pas utiliseé car il n'est pas rappeler dans la variable $UserInfo

#Q.2.9

# On peut importer la fonction via la commande Import-Module

# On peut ajouter la fonction directement dans le script AddLocalUsers

#Q.2.16

# La fonction sert à remplacer les caracteres avec des accents par leur equivalent sans, elle convertie tout les caracteres en minuscules
# exemple: Styrbjörn;Colin devient Styrbjorn.Colin



# Script Corriger

Write-Host "--- Début du script ---"

function Log
{
    param([string]$FilePath,[string]$Content)

    # Vérifie si le fichier existe, sinon le crée
    If (-not (Test-Path -Path $FilePath))
    {
        New-Item -ItemType File -Path $FilePath | Out-Null
    }

    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date;$User;$Content"

    # Ajoute la ligne de journal au fichier
    Add-Content -Path $FilePath -Value $logLine
}

Function Random-Password ($length = 12)  #Modification de 6 à 12
{
    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122

    $password = get-random -count $length -input ($punc + $digits + $letters) |`
        ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
    Return $password.ToString()
}

Function ManageAccentsAndCapitalLetters
{
    param ([String]$String)
    
    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

# Passage du SKIP de 2 à 1 et supression des champs "telephoneNumber" "mail" "mobile"
$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","societe","fonction","service","description","scriptPath" -Encoding UTF8 | Select-Object -Skip 1 

foreach ($User in $Users)
{
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.Nom
    $Name = "$Prenom.$Nom"
    If (-not(Get-LocalUser -Name "$Prenom.$Nom" -ErrorAction SilentlyContinue))
    {
        $Pass = Random-Password
        $Password = (ConvertTo-secureString $Pass -AsPlainText -Force)
        $Description = "$($user.description) - $($User.fonction)"
        $UserInfo = @{
            Name                 = "$Name"
            FullName             = "$Name"
            Password             = $Password
            Description          = $Description  #Ajout du champs Description pour la création des utilisateurs
            AccountNeverExpires  = $true
            PasswordNeverExpires = $true  #Passage de False à true
        }

        New-LocalUser @UserInfo
        Add-LocalGroupMember -Group "Users" -Member "$Name"  #Modification du nom de groupe
        Write-Host "L'utilisateur $Name a été crée"
        Write-Host "Le compte $Name a été crée avec le mot de passe $Pass" -ForegroundColor Green  #Ajout de la ligne pour afficher le mot de passe crée en vert
        Log -FilePath "C:\Scripts\Log.log" -Content "le compte local $Name à été crée"  #Ajout de la ligne  pour l'increment du fichier log
    }
     else
    { 
         Write-Host "Le compte local $Name existe déjà" -ForegroundColor Red   #Ajout de la ligne pour indiquer l'erreur en rouge
        Log -FilePath "C:\Scripts\Log.log" -Content "Le compte local $Name existe déjà"  #Ajout de la ligne  pour l'increment du fichier log
    }
}

pause
Write-Host "--- Fin du script ---"
Read-Host -Prompt "Appuyez sur Entrée pour terminer"  #Ajout de la ligne pour quitter le script avec entré


