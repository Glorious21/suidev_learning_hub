/*
/// Module: suidev_learning_hub
module suidev_learning_hub::suidev_learning_hub;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module suidev_learning_hub::suidev_learning_hub {

    use std::string::String;
    use sui::event::emit;

    public struct Student has key, copy, store {
        id: UID,
        name: String,
        
    }

    public entry fun Student(name: String,  ctx: &mut TxContext) {
    let Student = StudentObject {
        id: object::new(ctx),
        name,
        
    };
    transfer::public_transfer(Student, ctx.sender()); // owned by an address
    
}



}