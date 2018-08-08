scriptname Benchmark_Controller extends Quest hidden

Quest[] property PlayerReferenceBenchmarks auto

ActorBase property BenchmarkNPC auto
Actor property PlayerRef auto

event OnInit()
  PlayerRef.PlaceAtMe(BenchmarkNPC)
endEvent

function StartPlayerReferenceBenchmark()
  int pos = PlayerReferenceBenchmarks.Length

  while pos
    pos -= 1

    PlayerReferenceBenchmarks[pos].Reset()
    PlayerReferenceBenchmarks[pos].Start()
  endWhile
endFunction
