import re
import subprocess

file = open("tmp.txt", "r")
count = 0
  
while True:
    count += 1
  
    # Get next line from file
    line = file.readline()
  
    # if line is empty
    # end of file is reached
    if not line:
        break
    
    step1 = re.split("\d+", line, 1)
    step2 = re.split("tsm -a", step1[1], 1)
    
    #print(step2[1].strip().replace('\\', ''))
    step3 = step2[1].strip().replace('\\', '').replace('"', '')
    cmd = subprocess.run(["transmission-remote", "-a", step3])
    
  
file.close()
