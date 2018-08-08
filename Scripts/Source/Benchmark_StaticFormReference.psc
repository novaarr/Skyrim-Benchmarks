scriptname Benchmark_StaticFormReference extends Quest hidden

import Benchmark_Utility

ReferenceAlias property BenchmarkNPCAlias auto
Ammo property DwarvenSphereBolt02 auto

event OnInit()
  if !IsRunning()
    return
  endIf

  Debug.Notification("Benchmark: StaticFormReference: Starting")

  StaticTest(1)
  StaticTest(50)
  StaticTest(100)
  StaticTest(1000)

  Debug.Notification("Benchmark: StaticFormReference: Done")
endEvent

function StaticTest(int n)
  int times = n
  float t_start = Utility.GetCurrentRealTime()

  while times
    times -= 1

    BenchmarkNPCAlias.GetActorReference().AddItem(DwarvenSphereBolt02, 1, true)
  endWhile

  float t_end = Utility.GetCurrentRealTime()
  float t_delta = t_end - t_start

  BenchLog("StaticFormReference", n, t_delta)
endFunction
