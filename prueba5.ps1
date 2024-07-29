# FALTA PARAMETRO PARA QUE MUESTRE LOS DOMINIOS DISPONIBLES
# FALTA PARAMETRO PARA ELIMINAR EL ULTIMO DOMINIO AGREGADO
# FALTA LO MAS COMPLICADO, MODULARLO PARA PODER SELECCIONAR EL DOMINIO QUE QUIERO ELIMINAR

param (
    [int]$n,
    [string[]]$a
)

$domainCount = 
                5

$domainCountPivot = $domainCount + 1

# Define los textos que deseas agregar
$fb = "127.0.0.1	www.facebook.com"
$twitch = "127.0.0.1	www.twitch.tv"
$insta = "127.0.0.1	www.instagram.com"
$xv = "127.0.0.1    www.xvideos.com"
        # New variable here
    

# Crea un archivo temporal y lo reemplaza por el original
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
    $filePath = "F:\workspace\scripts\archivo.txt"

    switch ($n) {
        0 
        {
            # No hacer nada, restaurar el archivo a su estado original
            if (Test-Path -Path $filePath) {

                $lines = Get-Content -Path $filePath
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
                $lines = Get-Content -Path $filePath
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
                $lines = Get-Content -Path $filePath
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
                $lines = Get-Content -Path $filePath
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
                $lines = Get-Content -Path $filePath
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


function Remove-Domain{
    param(
        [string]$alias
    )

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
                `$lines = Get-Content -Path `$filePath
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

    $newParameter = "`$$varName = `"127.0.0.1    $domain`"
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
        } else {
            # Mantener la linea sin cambios
            $_
        }
    }
    $tempFilePath = "$PSCommandPath.tmp"
    Set-Content -Path $tempFilePath -Value $scriptContent

    Modify-Temp
}

if ($PSBoundParameters.ContainsKey('n')) {
    Modify-File -n $n
}

if ($PSBoundParameters.ContainsKey('a') -and $a.Length -eq 2) {
    Update-Script -a $a
}