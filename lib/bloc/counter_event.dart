// When there are ,ultiple events , use sealed class
sealed class CounterEvent{
 
}
class CounterIncrementEvent extends CounterEvent{

}
class CounterDecrementEvent extends CounterEvent{

}