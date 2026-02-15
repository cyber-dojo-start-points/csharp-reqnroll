# --------------------------------------------------------------
# Text files under /sandbox are automatically returned...
source ~/cyber_dojo_fs_cleaners.sh

function cyber_dojo_enter()
{
  : # 1. Only return _newly_ generated reports.
  #cyber_dojo_reset_dirs ${...}
}
function cyber_dojo_exit()
{
  : # 2. Remove text files we don't want returned.
  cyber_dojo_delete_dirs /sandbox/bin 
  cyber_dojo_delete_dirs /sandbox/obj
  #cyber_dojo_delete_files ...
  #find . -iname '*.feature.cs' -exec rm '{}' \;
}
cyber_dojo_enter
trap cyber_dojo_exit EXIT SIGTERM

ls -la 
dotnet restore --source /home/sandbox/.nuget/packages/
dotnet test --no-restore
ls -al

# On CI workflow you get...
# "./cyber-dojo.sh: line 22:    14 File size limit exceeded(core dumped) dotnet restore --source /home/sandbox/.nuget/packages/\n",
# "./cyber-dojo.sh: line 23:    16 File size limit exceeded(core dumped) dotnet test --no-restore\n"


