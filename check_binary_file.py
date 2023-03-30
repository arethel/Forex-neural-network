import pandas as pd
import numpy as np

fileName = "EURUSD 60000.csv"

df = pd.read_csv(fileName, encoding='utf-16', delimiter=";", header=None)

ticksArray = df.values


for i in np.arange(ticksArray.shape[0]-1, 0, -1):
    ticksArray[i]-=ticksArray[i-1]
    ticksArray[i][1]=np.round(10e4*ticksArray[i][1])
    ticksArray[i][2]=np.round(10e4*ticksArray[i][2])


testingDataName = "testingData.csv"

ticksArray = np.delete(ticksArray, 0, 0)
ticksArray = np.delete(ticksArray, 2, 1)

pd.DataFrame(ticksArray).to_csv(testingDataName, sep=";", encoding='utf-16', index=False, header=None)
