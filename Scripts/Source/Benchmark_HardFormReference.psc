scriptname Benchmark_HardFormReference extends Quest hidden

import Benchmark_Utility

ReferenceAlias property BenchmarkNPCAlias auto

event OnInit()
  if !IsRunning()
    return
  endIf

  Debug.Notification("Benchmark: HardFormReference: Starting")

  HardDynamicTest(1)
  HardDynamicTest(50)
  HardDynamicTest(100)
  HardDynamicTest(1000)

  Debug.Notification("Benchmark: HardFormReference: Done")
endEvent

function HardDynamicTest(int n)
  int times = n
  float t_start = Utility.GetCurrentRealTime()

  while times
    times -= 1

    BenchmarkNPCAlias.GetActorReference().AddItem(Game.GetFormFromFile(0x10EC8C, "Skyrim.esm"), 1, true)
  endWhile

  float t_end = Utility.GetCurrentRealTime()
  float t_delta = t_end - t_start

  BenchLog("HardFormReference", n, t_delta)
endFunction
