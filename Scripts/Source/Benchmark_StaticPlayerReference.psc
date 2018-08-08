scriptname Benchmark_StaticPlayerReference extends Quest hidden

import Benchmark_Utility

Actor property PlayerRef auto

event OnInit()
  if !IsRunning()
    return
  endIf

  Debug.Notification("Benchmark: StaticPlayerReference: Starting")

  StaticTest(1)
  StaticTest(50)
  StaticTest(100)
  StaticTest(1000)

  Debug.Notification("Benchmark: StaticPlayerReference: Done")
endEvent

function StaticTest(int n)
  int times = n
  float t_start = Utility.GetCurrentRealTime()

  while times
    times -= 1

    PlayerRef.ClearLookAt()
  endWhile

  float t_end = Utility.GetCurrentRealTime()
  float t_delta = t_end - t_start

  BenchLog("StaticPlayerReference", n, t_delta)
endFunction
