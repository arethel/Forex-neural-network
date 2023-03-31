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

input int bars_count_to_save = 10000;


void OnStart(){
   
   int MA_handle=iMA(NULL,0,20,0,MODE_SMA,PRICE_CLOSE);
   double MA[];
   CopyBuffer(MA_handle,0,1,bars_count_to_save,MA);
   
   ArraySetAsSeries(MA,true);
   
   int handle = FileOpen(_Symbol+" "+ IntegerToString(bars_count_to_save)+IntegerToString(PERIOD_CURRENT)+".csv", FILE_WRITE|FILE_CSV, ";");
   
   for(int i = bars_count_to_save-1; i>=0; i--){
      FileWrite(handle, MA[i]);
   }
   
   
   FileClose(handle);
   
   
}
//+------------------------------------------------------------------+
