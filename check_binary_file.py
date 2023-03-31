import pandas as pd
import numpy as np

fileName = "EURUSD 100000 H1 MA 20.csv"

df = pd.read_csv(fileName, encoding='utf-16', delimiter=";", header=None)

ticksArray = df.values


for i in np.arange(ticksArray.shape[0]-1, 0, -1):
    ticksArray[i]-=ticksArray[i-1]
    ticksArray[i]=np.round(10e5*ticksArray[i])
    
    


testingDataName = "testingData.csv"

ticksArray = np.delete(ticksArray, 0, 0)
# ticksArray = np.delete(ticksArray, 2, 1)

pd.DataFrame(ticksArray).to_csv(testingDataName, sep=";", encoding='utf-16', index=False, header=None)
