import glob
import os
import shutil
#from update_version import package_name
package_name = "Trashcan_0.1.0"
factorio_mods= os.path.join(os.path.expandvars("%appdata%"),"Factorio\mods")
target_dest = os.path.join(factorio_mods,"%s.zip"%(package_name)) # eventually
print "OK:",target_dest
for item in glob.glob(os.path.join(factorio_mods,"Trashcan_*")):
    if os.path.isdir(item):
        shutil.rmtree(item)
    else:
        os.remove(item)
shutil.copytree("Trashcan",os.path.join(factorio_mods,package_name))
