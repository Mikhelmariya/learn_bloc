// when there are multiple events ,use sealed
sealed class CounterEvent{

}
class CounterIncrementEvent extends CounterEvent{

}
class CounterDecrementEvent extends CounterEvent{

}