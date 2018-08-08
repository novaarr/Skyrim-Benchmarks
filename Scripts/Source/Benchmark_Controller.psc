scriptname Benchmark_Controller extends Quest hidden

Quest[] property PlayerReferenceBenchmarks auto
Quest[] property FormReferenceBenchmarks auto
Benchmark_Stress property Stress auto

function StartPlayerReferenceBenchmark()
  int pos = PlayerReferenceBenchmarks.Length

  while pos
    pos -= 1

    PlayerReferenceBenchmarks[pos].Reset()
    PlayerReferenceBenchmarks[pos].Start()
  endWhile
endFunction

function StartFormReferenceBenchmark()
  int pos = FormReferenceBenchmarks.Length

  while pos
    pos -= 1

    FormReferenceBenchmarks[pos].Reset()
    FormReferenceBenchmarks[pos].Start()
  endWhile
endFunction

function StartStress(float update)
  Stress.Start()
  Stress.UpdateTime = update ; ugh..
endFunction
