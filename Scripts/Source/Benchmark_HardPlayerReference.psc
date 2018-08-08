scriptname Benchmark_HardPlayerReference extends Quest hidden

import Benchmark_Utility

event OnInit()
  if !IsRunning()
    return
  endIf
  
  Debug.Notification("Benchmark: HardPlayerReference: Starting")

  HardDynamicTest(1)
  HardDynamicTest(50)
  HardDynamicTest(100)
  HardDynamicTest(1000)

  Debug.Notification("Benchmark: HardPlayerReference: Done")
endEvent

function HardDynamicTest(int n)
  int times = n
  float t_start = Utility.GetCurrentRealTime()

  while times
    times -= 1

    Game.GetPlayer().ClearLookAt()
  endWhile

  float t_end = Utility.GetCurrentRealTime()
  float t_delta = t_end - t_start

  BenchLog("HardPlayerReference", n, t_delta)
endFunction
