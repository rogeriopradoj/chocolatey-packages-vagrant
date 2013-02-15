try {
  # Vagrant 1.0.6
  $url = 'http://files.vagrantup.com/packages/476b19a9e5f499b5d0b9d4aba5c0b16ebe434311/Vagrant.msi'
  $packageName = 'vagrant-base'
  $installerType = 'msi'
  $url64 = $url
  $silentArgs = '/quiet'
  $validExitCodes = @(0)	

  # Configure install location
  if ($env:chocolatey_bin_root -ne $null) {
    # Set installation directory to user-configured bin directory
    $installDir = join-path $env:systemdrive $env:chocolatey_bin_root
  }
  else {
    # Set installation directory to C:\Bin
    $installDir = join-path $env:systemdrive "\bin"
  }
  $env:chocolateyInstallArguments = " INSTALLDIR=`"" + $installDir + "`" "

  # Run MSI installer
  Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes

  Write-ChocolateySuccess '__NAME__'
}
catch {
  Write-ChocolateyFailure '__NAME__' $($_.Exception.Message)
  throw 
}