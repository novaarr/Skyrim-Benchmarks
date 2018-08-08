scriptname Benchmark_Utility hidden

function BenchLog(string benchmark, int iterations, float seconds) global
  string log  = "Benchmarks (" +benchmark + "): finished in "                 \
              + seconds + " seconds (n=" + iterations + ")"

  MiscUtil.PrintConsole(log)
  Debug.Trace(log)
endFunction
