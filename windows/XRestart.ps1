$vcxsrv = Get-Process vcxsrv -ErrorAction SilentlyContinue

if ($vcxsrv) {
  $vcxsrvid = $vcxsrv.id
  Stop-Process -Id $vcxsrvid
  Wait-Process -Id $vcxsrvid
}

& "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -multiwindow -clipboard -wgl -ac