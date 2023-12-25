// Bidding App
use debug::PrintTrait;
fn main() {
    let x = 5;
    let x = x + 1; //x shadows to give a value of 6
    {
        let x = x * 2; // 6 * 2 = 12
        'Inner scope x value is:'.print();
        x.print()
    }
    'Outer scope x value is:'.print();
    x.print(); //6
}

fun Bidding() {

   let x = 15;
    x.print();

}
