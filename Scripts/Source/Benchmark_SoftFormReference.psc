scriptname Benchmark_SoftFormReference extends Quest hidden

import Benchmark_Utility

ReferenceAlias property BenchmarkNPCAlias auto

event OnInit()
  if !IsRunning()
    return
  endIf

  Debug.Notification("Benchmark: SoftFormReference: Starting")

  SoftDynamicTest(1)
  SoftDynamicTest(50)
  SoftDynamicTest(100)
  SoftDynamicTest(1000)

  Debug.Notification("Benchmark: SoftFormReference: Done")
endEvent

function SoftDynamicTest(int n)
  int times = n
  float t_start = Utility.GetCurrentRealTime()

  Form DwarvenSphereBolt02 = Game.GetFormFromFile(0x10EC8C, "Skyrim.esm")

  while times
    times -= 1

    BenchmarkNPCAlias.GetActorReference().AddItem(DwarvenSphereBolt02, 1, true)
  endWhile

  float t_end = Utility.GetCurrentRealTime()
  float t_delta = t_end - t_start

  BenchLog("SoftFormReference", n, t_delta)
endFunction
