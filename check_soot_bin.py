import pandas as pd
import numpy as np


fileName = "testingData.csv"

df = pd.read_csv(fileName, encoding='utf-16', delimiter=";", header=None)

ticksArray = df.values

analyze_ticks=51
result_ticks=20
kol = 0
ob = 0
for idx in np.arange(analyze_ticks-1, ticksArray.shape[0]-result_ticks-1):
    
    # analyze_set = np.array([])
    # for i in np.arange(analyze_ticks-1, 0, -1):
    #     analyze_set = np.append(analyze_set, ticksArray[idx-i], 0)
    result_sum = 0
    for i in np.arange(result_ticks):
       result_sum+=ticksArray[idx+i+1][1]
    if(abs(result_sum)>20):
        kol+=1
        ob+=1
    elif np.random.rand()<0.1:
        ob +=1

print(kol/ob*100)
print(ob)