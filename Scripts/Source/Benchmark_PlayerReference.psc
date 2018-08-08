scriptname Benchmark_PlayerReference extends Quest hidden

Actor property PlayerRef auto

event OnInit()
  Debug.Notification("Benchmark: PlayerReference: Starting")

  StaticTest(1)
  SoftDynamicTest(1)
  HardDynamicTest(1)

  StaticTest(50)
  SoftDynamicTest(50)
  HardDynamicTest(50)

  StaticTest(100)
  SoftDynamicTest(100)
  HardDynamicTest(100)

  StaticTest(1000)
  SoftDynamicTest(1000)
  HardDynamicTest(1000)

  Debug.Notification("Benchmark: PlayerReference: Done")
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

  Log("Benchmarks - Player Reference Retrieval - Static: "                    \
    + "Finished " + n + " iterations in " + t_delta + " seconds"              )
endFunction

function SoftDynamicTest(int n)
  int times = n
  float t_start = Utility.GetCurrentRealTime()

  Actor player = Game.GetPlayer()

  while times
    times -= 1

    player.ClearLookAt()
  endWhile

  float t_end = Utility.GetCurrentRealTime()
  float t_delta = t_end - t_start

  Log("Benchmarks - Player Reference Retrieval - Dynamic (Soft): "            \
    + "Finished " + n + " iterations in " + t_delta + " seconds"              )
endFunction

function HardDynamicTest(int n)
  int times = n
  float t_start = Utility.GetCurrentRealTime()

  while times
    times -= 1

    Game.GetPlayer().ClearLookAt()
  endWhile

  float t_end = Utility.GetCurrentRealTime()
  float t_delta = t_end - t_start

  Log("Benchmarks - Player Reference Retrieval - Dynamic (Hard): "            \
    + "Finished " + n + " iterations in " + t_delta + " seconds"              )
endFunction

function Log(string msg)
  MiscUtil.PrintConsole(msg)
  Debug.Trace(msg)
endFunction
