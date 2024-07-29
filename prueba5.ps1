# FALTA ELIMINAR EL ULTIMO DOMINIO
# VER EL NIVEL ACTUAL

param (
    [switch]$s,
    [int]$n,
    [string[]]$a
)

# Verificar si el script se está ejecutando como administrador
function Test-Administrator {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-Administrator)) {
    if ($PSBoundParameters.ContainsKey('n')) {
        $newProcess = Start-Process powershell.exe -ArgumentList "-File `"$PSCommandPath`" -n $n" -Verb RunAs
        exit
    }
}

$domainCount = 
                5

$domainCountPivot = $domainCount + 1

# Define los dominios a bloquear
$fb = "127.0.0.1	www.facebook.com"
$twitch = "127.0.0.1	www.twitch.tv"
$insta = "127.0.0.1	www.instagram.com"
$xv = "127.0.0.1       www.xvideos.com"
        # New variable here
    
# Arrays de dominios
$domains = @("www.facebook.com", "www.twitch.tv", "www.instagram.com", "www.xvideos.com"
# New domain here
)

# Tags de los dominios
$tags = @("fb", "twitch", "insta", "xv"
# New tag here
)

if ($s){
    Write-Output "Nivel`t`tTag`t`tDominio"
    Write-Output "-----`t`t---`t`t-------"
    for($i=0; $i -lt $domains.Length; $i++) {
        Write-Output "  $($i+1)  `t`t$($tags[$i]) `t`t$($domains[$i])"
    }
}

# Crea un archivo temporal de hosts y lo reemplaza por el original
function Temp-File{
    param(
        [string[]]$lines
    )
    $tempFilePath = "$filePath.tmp"
    Set-Content -Path $tempFilePath -Value $lines
    Move-Item -Path $tempFilePath -Destination $filePath -Force
}


function Modify-File {
    param (
        [int]$n = 0
    )

    # Define la ruta del archivo de texto
    $filePath = "C:\Windows\System32\drivers\etc\hosts"

    switch ($n) {
        99 {
            # No hacer nada, restaurar el archivo a su estado original
            if (Test-Path -Path $filePath) {

                [string[]]$lines = Get-Content -Path $filePath
                # Eliminar $insta si existe
                $lines = $lines | Where-Object { $_ -ne $insta }
                # Eliminar $twitch si existe
                $lines = $lines | Where-Object { $_ -ne $twitch }
                # Eliminar $fb si existe
                $lines = $lines | Where-Object { $_ -ne $fb }
                # Eliminar $xv si existe
                $lines = $lines | Where-Object { $_ -ne $xv }
                # Eliminar $newVar si existe

                Temp-File $lines

                Write-Output "El archivo ha sido restaurado a su estado original."
            } else {
                Write-Output "Concentracion desactivada"
            }
        }
        1 {
            if (Test-Path -Path $filePath) {
                [string[]]$lines = Get-Content -Path $filePath
                # Eliminar $twitch si existe
                $lines = $lines | Where-Object { $_ -ne $twitch }
                # Eliminar $fb si existe
                $lines = $lines | Where-Object { $_ -ne $fb }
                # Eliminar $xv si existe
                $lines = $lines | Where-Object { $_ -ne $xv }
                # Eliminar $newVar si existe
                # Agregar $insta si no existe
                if ($lines -notcontains $insta) {
                    $lines += "$insta"
                }
                Temp-File $lines
            } else {
                # Crear archivo y agregar $newContent1
                Set-Content -Path $filePath -Value $insta
            }
            Write-Output "Concentracion nivel 1."
        }
        2 {
            if (Test-Path -Path $filePath) {
                [string[]]$lines = Get-Content -Path $filePath
                # Eliminar $fb si existe
                $lines = $lines | Where-Object { $_ -ne $fb }
                # Eliminar $xv si existe
                $lines = $lines | Where-Object { $_ -ne $xv }
                # Eliminar $newVar si existe
                # Agregar $insta si no existe
                if ($lines -notcontains $insta) {
                    $lines += "$insta"
                }
                # Agregar $twitch si no existe
                if ($lines -notcontains $twitch) {
                    $lines += "$twitch"
                }
                Temp-File $lines
            } else {
                # Crear archivo y agregar $newContent2
                Set-Content -Path $filePath -Value $twitch
            }
            Write-Output "Concentracion nivel 2."
        }
        3 {
            if (Test-Path -Path $filePath) {
                [string[]]$lines = Get-Content -Path $filePath
                # Eliminar $xv si existe
                $lines = $lines | Where-Object { $_ -ne $xv }
                # Eliminar $newVar si existe
                # Agregar $insta si no existe
                if ($lines -notcontains $insta) {
                    $lines += "$insta"
                }
                # Agregar $twitch si no existe
                if ($lines -notcontains $twitch) {
                    $lines += "$twitch"
                }
                # Agregar $fb si no existe
                if ($lines -notcontains $fb) {
                    $lines += "$fb"
                }
                Temp-File $lines
            } else {
                # Crear archivo y agregar $newContent2
                Set-Content -Path $filePath -Value $twitch
            }
            Write-Output "Concentracion nivel 3."
        }

        4 {
            if (Test-Path -Path $filePath) {
                [string[]]$lines = Get-Content -Path $filePath
                # Eliminar $newVar si existe
                # Agregar $insta si no existe
                if ($lines -notcontains $insta) {
                    $lines += "$insta"
                }
                # Agregar $twitch si no existe
                if ($lines -notcontains $twitch) {
                    $lines += "$twitch"
                }
                # Agregar $fb si no existe
                if ($lines -notcontains $fb) {
                    $lines += "$fb"
                }
                # Agregar $xv si no existe
                if ($lines -notcontains $xv) {
                    $lines += "$xv"
                }

                Temp-File $lines

                
            } else {
                # Crear archivo y agregar $newContent2
                Set-Content -Path $filePath -Value $twitch
            }
                Write-Output "Concentracion nivel 4."
        }

        # New code here    
    

        default {
            Write-Output "Par�metro no reconocido. Use -n 0, -n 1, o -n 2."
        }
    }
}


function Remove-Last-Domain{

    $filePath = "F:\workspace\scripts\archivo.txt"

    if (Test-Path -Path $filePath) {
        $lines = Get-Content -Path $filePath
        $lines = $lines | Where-Object { $_ -ne $page }
        Temp-File $lines
    } else {
        Write-Output "El archivo no existe."
    }
}


function Modify-Temp{

    $scriptContent2 = Get-Content -Path "$PSCommandPath.tmp"
    $addNextModification = "# Next modification here"
    $newAddModification = $null

    $firstLine = '# Agregar `$$varName si no existe'
    $secondLine = 'if (`$lines -notcontains `$$varName) {'
    $thirdLine = '`$lines += `"`$$varName`"'

    $aReplace = $a[0]

    $newFirstLine = "               # Agregar ```$$aReplace si no existe"
    $newSecondLine = "                if (```$lines -notcontains ```$$aReplace) {"
    $newThirdLine = "                    ```$lines += ```"```$$aReplace```""


    $found1 = $false
    $found2 = $false
    $found3 = $false
    $found4 = $false
    $found5 = $false
    $found6 = $false

    $scriptContent2  = $scriptContent2 | ForEach-Object{
        if (-not $found1 -and $_.Trim() -eq $oldOldDomainCount) {
            $found1 = $true
            $newOldDomainCount
        } elseif (-not $found2 -and $_.Trim() -eq $oldNewDomainCount) {
            $found2 = $true
            $newNewDomainCount
        } elseif (-not $found3 -and $_.Trim() -eq $addNextModification) {
            $found3 = $true
            $newAddModification
        } elseif (-not $found4 -and $_.Trim() -eq $firstLine) {
            $found4 = $true
            $newFirstLine
        } elseif (-not $found5 -and $_.Trim() -eq $secondLine) {
            $found5 = $true
            $newSecondLine
        } elseif (-not $found6 -and $_.Trim() -eq $thirdLine) {
            $found6 = $true
            $newThirdLine
        } else {
            # Mantener la linea sin cambios
            $_
        }
    }

    $tempFilePath2 = "$PSCommandPath.tmp2"
    Set-Content -Path $tempFilePath2 -Value $scriptContent2
    # Move-Item -Path $tempFilePath2 -Destination $PSCommandPath -Force
    # Remove-Item -Path "$PSCommandPath.tmp"
}

function Update-Script{
    param(
        [string[]]$a
    )

    $varName = $a[0]
    $domain = $a[1]

    $oldDomainCount = '$domainCount ='
    $newDomainCount = "`$domainCount =
        $domainCountPivot"

    $oldValueDomainCount = "$domainCount"
    $newValueDomainCount = $null


    $addDomain = "# New code here"
    $addParameter = "# New variable here"
    $addNextModification = "# Next modification here"
    $scriptContent = Get-Content -Path $PSCommandPath

    $newDomain = "        $domainCount {
            if (Test-Path -Path `$filePath) {
                [string[]]`$lines = Get-Content -Path `$filePath
                # Eliminar `$newVar si existe
                # Agregar `$insta si no existe
                if (`$lines -notcontains `$insta) {
                    `$lines += `"`$insta`"
                }
                # Agregar `$twitch si no existe
                if (`$lines -notcontains `$twitch) {
                    `$lines += `"`$twitch`"
                }
                # Agregar `$fb si no existe
                if (`$lines -notcontains `$fb) {
                    `$lines += `"`$fb`"
                }
               # Agregar `$xv si no existe
                if (`$lines -notcontains `$xv) {
                    `$lines += `"`$xv`"
                }
                # Agregar `$$varName si no existe
                if (`$lines -notcontains `$$varName) {
                    `$lines += `"`$$varName`"
                }
                # Next modification here
                Temp-File `$lines

                
            } else {
                # Crear archivo y agregar `$newContent2
                Set-Content -Path `$filePath -Value `$twitch
            }
                Write-Output `"Concentracion nivel $domainCount.`"
        }

        # New code here"

    $newParameter = "`$$varName = `"127.0.0.1       $domain`"
        # New variable here"

    $newAddModification = "                # Agregar ``$`$varName si no existe
                if (```$lines -notcontains ``$`$varName) {
                    ```$lines += ```"``$`$varName```"
                }
                # Next modification here"

    $replaceDeletePivot = '# Eliminar $newVar si existe'
    $newReplaceDelete = "                # Eliminar `$$varName si existe
                `$lines = `$lines | Where-Object { `$_ -ne `$$varName }
                # Eliminar `$newVar si existe"

    $replaceDomainComent = "# New domain here"
    $newDomainElement = "        , `"$domain`"
        # New domain here"

    $replaceTagComent = "# New tag here"
    $newTagElement = "        , `"$varName`"
        # New tag here"

    $found1 = $false
    $found2 = $false
    $found3 = $false
    $found4 = $false
    $found5 = $false

    $scriptContent = $scriptContent | ForEach-Object{
        if (-not $found1 -and $_.Trim() -eq $oldDomainCount) {
            $found1 = $true
            $newDomainCount
        } elseif (-not $found2 -and $_.Trim() -eq $oldValueDomainCount) {
            $found2 = $true
            $newValueDomainCount
        } elseif (-not $found3 -and $_.Trim() -eq $addNextModification) {
            $found3 = $true
            $newAddModification
        } elseif (-not $found4 -and $_.Trim() -eq $addParameter) {
            $found4 = $true
            $newParameter
        } elseif (-not $found5 -and $_.Trim() -eq $addDomain) {
            $found5 = $true
            $newDomain
        } elseif ($_.Trim() -eq $replaceDeletePivot) {
            $newReplaceDelete
        } elseif ($_.Trim() -eq $replaceDomainComent) {
            $newDomainElement
        } elseif ($_.Trim() -eq $replaceTagComent) {
            $newTagElement
        } else {
            # Mantener la linea sin cambios
            $_
        }
    }
    $tempFilePath = "$PSCommandPath.tmp"
    Set-Content -Path $tempFilePath -Value $scriptContent

    Modify-Temp
}

if($n){
    Modify-File -n $n
}

if($a){
    Update-Script -a $a
}