scriptname Benchmark_ControllerAlias_Player extends ReferenceAlias hidden

ActorBase property BenchmarkNPC auto
ReferenceAlias property BenchyAlias auto

Actor PlayerRef

event OnInit()
  PlayerRef = GetActorReference()

  if PlayerRef ; dude, what?    
    BenchyAlias.ForceRefTo(PlayerRef.PlaceAtMe(BenchmarkNPC))
  endIf
endEvent

event OnPlayerLoadGame()
  MoveBenchmarkNPCNearPlayer()
endEvent

event OnCellLoad()
  MoveBenchmarkNPCNearPlayer()
endEvent

function MoveBenchmarkNPCNearPlayer()
  BenchyAlias.GetActorReference().MoveTo(PlayerRef, 100, 100)
  BenchyAlias.GetActorReference().SetLookAt(PlayerRef)
endFunction
