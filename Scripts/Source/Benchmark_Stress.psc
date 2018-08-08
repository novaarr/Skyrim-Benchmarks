scriptname Benchmark_Stress extends Quest hidden

float property UpdateTime auto hidden

event OnInit()
  if !IsRunning()
    return
  endIf

  Debug.Notification("Stressing each " + UpdateTime + "s")
endEvent
