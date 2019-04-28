import os
os.chdir('images')
count = 1
for filename in os.listdir("."):
    os.rename(filename, str(count)+'.jpg')
    count = count + 1