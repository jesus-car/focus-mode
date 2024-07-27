param (
    [int]$n,
    [string[]]$a
)

$domainCount = 4

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

    # Define los textos que deseas agregar
    $fb = "127.0.0.1	www.facebook.com"
    $twitch = "127.0.0.1	www.twitch.tv"
    $insta = "127.0.0.1	www.instagram.com"
    $xv = "127.0.0.1     www.xvideos.com"
    $yt = "127.0.0.1    www.youtube.com"
    $pz = "127.0.0.1    www.pinza.com"
        # New variable here
    
    
    

    switch ($n) {
        0 {
            # No hacer nada, restaurar el archivo a su estado original
            if (Test-Path -Path $filePath) {

                $lines = Get-Content -Path $filePath
                # Eliminar $insta si existe
                $lines = $lines | Where-Object { $_ -ne $insta }
                # Eliminar $twitch si existe
                $lines = $lines | Where-Object { $_ -ne $twitch }
                # Eliminar $fb si existe
                $lines = $lines | Where-Object { $_ -ne $fb }

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

        5 {
            if (Test-Path -Path $filePath) {
                $lines = Get-Content -Path $filePath
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
                # Agregar $yt si no existe
                if ($lines -notcontains $yt) {
                    $lines += "$yt"
                }

                Temp-File $lines

                
            } else {
                # Crear archivo y agregar $newContent2
                Set-Content -Path $filePath -Value $twitch
            }
                Write-Output "Concentracion nivel 4."
            }

        6 {
            if (Test-Path -Path $filePath) {
                $lines = Get-Content -Path $filePath
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
               # Agregar $yt si no existe
                if ($lines -notcontains $yt) {
                    $lines += "$yt"
                }
                # Agregar $pz si no existe
                if ($lines -notcontains $pz) {
                    $lines += "$pz"
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

function Modify-Temp{

    $scriptContent2 = Get-Content -Path "$PSCommandPath.tmp"
    $addNextModification = "# Next modification here"
    $newAddModification = ""

    $firstLine = '# Agregar `$$varName si no existe'
    $secondLine = 'if (`$lines -notcontains `$$varName) {'
    $thirdLine = '`$lines += `"`$$varName`"'

    $aReplace = $a[0]

    $newFirstLine = "               # Agregar ```$$aReplace si no existe"
    $newSecondLine = "                if (```$lines -notcontains ```$$aReplace) {"
    $newThirdLine = "                    ```$lines += ```"```$$aReplace```""


    $found = $false
    $scriptContent2  = $scriptContent2 | ForEach-Object{
        if (-not $found -and $_.Trim() -eq $addNextModification) {
            $found = $true
            $newAddModification
        } else {
            # Mantener la linea sin cambios
            $_
        }
    }

    $found = $false
    $scriptContent2  = $scriptContent2 | ForEach-Object{
        if (-not $found -and $_.Trim() -eq $firstLine) {

            $found = $true
            $newFirstLine
        } else {
            # Mantener la linea sin cambios
            $_
        }
    }

    $found = $false
    $scriptContent2  = $scriptContent2 | ForEach-Object{
        if (-not $found -and $_.Trim() -eq $secondLine) {

            $found = $true
            $newSecondLine
        } else {
            # Mantener la linea sin cambios
            $_
        }
    }

    $found = $false
    $scriptContent2  = $scriptContent2 | ForEach-Object{
        if (-not $found -and $_.Trim() -eq $thirdLine) {

            $found = $true
            $newThirdLine
        } else {
            # Mantener la linea sin cambios
            $_
        }
    }
    $tempFilePath2 = "$PSCommandPath.tmp2"
    Set-Content -Path $tempFilePath2 -Value $scriptContent2
    Move-Item -Path $tempFilePath2 -Destination $PSCommandPath -Force
    Remove-Item -Path "$PSCommandPath.tmp"
}

function Update-Script{
    param(
        [string[]]$a
    )

    $varName = $a[0]
    $domain = $a[1]

    $addDomain = "# New code here"
    $addParameter = "# New variable here"
    $addNextModification = "# Next modification here"
    $scriptContent = Get-Content -Path $PSCommandPath

    $newDomain = "        $domainCount {
            if (Test-Path -Path `$filePath) {
                `$lines = Get-Content -Path `$filePath
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
               # Agregar `$yt si no existe
                if (`$lines -notcontains `$yt) {
                    `$lines += `"`$yt`"
                }
               # Agregar `$pz si no existe
                if (`$lines -notcontains `$pz) {
                    `$lines += `"`$pz`"
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

        # New code here    
    "

    $newParameter = "    `$$varName = `"127.0.0.1    $domain`"
        # New variable here
    "

    $newAddModification = "                # Agregar ``$`$varName si no existe
                if (```$lines -notcontains ``$`$varName) {
                    ```$lines += ```"``$`$varName```"
                }
                # Next modification here"

    $found = $false
    $scriptContent = $scriptContent | ForEach-Object{
        if (-not $found -and $_.Trim() -eq $addDomain) {
            # Reemplazar la linea con el contenido del array
            $found = $true
            $newDomain
        } else {
            # Mantener la linea sin cambios
            $_
        }
    }
    
    $found = $false
    $scriptContent = $scriptContent | ForEach-Object{
        if (-not $found -and $_.Trim() -eq $addParameter) {
            $found = $true
            $newParameter
        } else {
            # Mantener la linea sin cambios
            $_
        }
    }

    $found = $false
    $scriptContent = $scriptContent | ForEach-Object{
        if (-not $found -and $_.Trim() -eq $addNextModification) {
            $found = $true
            $newAddModification
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

