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
  cyber_dojo_delete_dirs /sandbox/generated
  cyber_dojo_delete_files /sandbox/TestResult.xml
  cyber_dojo_delete_files /sandbox/Reqnroll/userid
}
cyber_dojo_enter
trap cyber_dojo_exit EXIT SIGTERM

#FALLBACK, SLOWER ~2.0s:
# comment in the next line if anything below fails
#DOTNET_ROLL_FORWARD=LatestMajor dotnet test -p:RestoreSources=/home/sandbox/.nuget/packages/ ; exit

#FAST ~0.65s:
export DOTNET_ROLL_FORWARD=LatestMajor

CSC=$(find /usr/share/dotnet/sdk -name csc.dll | head -1)
CORE=$(ls -d /usr/share/dotnet/shared/Microsoft.NETCore.App/* | tail -1)
GENERATOR=~/reqnroll_generator/feature_code_generator.dll
NUNIT_PLUGIN=$(find ~/.nuget/packages/reqnroll.nunit -name 'Reqnroll.NUnit.Generator.ReqnrollPlugin.dll' | sort | tail -1)

# The assemblies your code is compiled against. They were resolved when this
# image was built, which is why there is nothing to download when you run.
REFERENCES=''
for dll in ~/dojo_refs/*.dll; do REFERENCES="${REFERENCES} -r:${dll}"; done
for dll in ${CORE}/System.*.dll ${CORE}/netstandard.dll; do REFERENCES="${REFERENCES} -r:${dll}"; done

# 1. Every .feature file becomes C#, at any depth, so a feature in a
# sub-directory is turned into tests like any other. Gherkin that cannot be
# parsed stops the run here and says which file it was in.
mkdir -p generated
for feature in $(find . -name '*.feature'); do
  generated="generated/$(echo "${feature#./}" | tr '/' '_').cs"
  if ! dotnet ${GENERATOR} "${feature}" "${generated}" "${PWD}" dojo "${NUNIT_PLUGIN}"; then
    exit 1
  fi
done

# 2. Every .cs file is compiled, at any depth, including the ones just
# generated and any that nothing else refers to yet, so a file you are midway
# through writing shows its errors instead of being passed over in silence.
mkdir -p bin
cp ~/dojo_refs/*.dll bin/
if ! dotnet ${CSC} -nologo -target:library -out:bin/dojo.dll ${REFERENCES} $(find . -name '*.cs'); then
  exit 1
fi

# 3. The tests are run straight from the compiled assembly. Going through
# [dotnet test] instead would restore and build all over again, which is most
# of the wait and none of the answer.
~/.dotnet/tools/nunit bin/dojo.dll --noheader --noresult --nocolor
