scriptname Benchmark_SoftPlayerReference extends Quest hidden

import Benchmark_Utility

Actor PlayerRef

event OnInit()
  if !IsRunning()
    return
  endIf

  Debug.Notification("Benchmark: SoftPlayerReference: Starting")

  SoftDynamicTest(1)
  SoftDynamicTest(50)
  SoftDynamicTest(100)
  SoftDynamicTest(1000)

  Debug.Notification("Benchmark: SoftPlayerReference: Done")
endEvent

function SoftDynamicTest(int n)
  int times = n
  float t_start = Utility.GetCurrentRealTime()

  PlayerRef = Game.GetPlayer()

  while times
    times -= 1

    PlayerRef.ClearLookAt()
  endWhile

  float t_end = Utility.GetCurrentRealTime()
  float t_delta = t_end - t_start

  BenchLog("SoftPlayerReference", n, t_delta)
endFunction
