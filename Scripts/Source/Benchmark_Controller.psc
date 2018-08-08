scriptname Benchmark_Controller extends Quest hidden

Quest[] property PlayerReferenceBenchmarks auto

function StartPlayerReferenceBenchmark()
  int pos = PlayerReferenceBenchmarks.Length

  while pos
    pos -= 1

    PlayerReferenceBenchmarks[pos].Reset()
    PlayerReferenceBenchmarks[pos].Start()
  endWhile
endFunction
