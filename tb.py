#TB Procedure
#1.Build Program
#2.Collect ENV Data // Notes
#3.Submit Program
#4.Check Result
#5.Run Profiler
#6.Archive Everything

import subprocess
import os
import shutil
from pathlib import Path
from datetime import datetime


if __name__ == "__main__":
    file_path = Path(__file__).parent
    file_path = file_path.__str__()
    print(file_path)
    log = ""
    
    
    #Make
    subprocess.run(["make"], capture_output=True, cwd=file_path)

    #Collect Env
    with open("./Makefile") as f:
        content = f.readlines()
    
    
    #Submit Job
    subprocess.run(["./job_submit"],capture_output=True, cwd=file_path)
    
    
    #Check Result
    subprocess.run(["make check",
                    "-DREF_FINAL_STATE_FILE=check/128x128.final_state.dat"
                    "-DREF_AV_VELS_FILE=check/128x128.av_vels.dat"
                    ],capture_output=True, cwd=file_path)
    
    
    #Run Profiler
    # subprocess.run([])
    
    
    
    #Clean/Archive
    dirname = datetime.now().strftime()
    filelist = ["d2q9-bgk",
                "av_vels.dat",
                "final_state.dat",
                "d2q9-bgk.out"]
    Path(file_path+"Archive/"+dirname).mkdir(parents=True,exist_ok=True)
    for file in filelist:
        shutil.move(file_path+"/"+file,file_path+"/"+"Archive/"+dirname)
    
    
