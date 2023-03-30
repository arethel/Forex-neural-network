//+------------------------------------------------------------------+
//|                                              GetHistoryTicks.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

input int ticks_count_to_save = 60000;


MqlTick tickHist[];
void OnStart(){
   ArrayResize(tickHist, ticks_count_to_save);
   CopyTicks(_Symbol, tickHist, COPY_TICKS_ALL, 0, ticks_count_to_save);
   
   int handle = FileOpen(_Symbol+" "+ IntegerToString(ticks_count_to_save)+".csv", FILE_WRITE|FILE_CSV, ";");
   
   for(int i =0; i<ticks_count_to_save; i++){
      FileWrite(handle, long(tickHist[i].time_msc), tickHist[i].bid, tickHist[i].ask);
   }
   
   FileClose(handle);
   
   
}
//+------------------------------------------------------------------+
