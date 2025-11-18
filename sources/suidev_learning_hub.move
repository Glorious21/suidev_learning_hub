/*
/// Module: suidev_learning_hub
module suidev_learning_hub::suidev_learning_hub;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module suidev_learning_hub::suidev_learning_hub {

    use std::string::String;
    use sui::event;

    //Init function
     fun init(ctx: &mut TxContext) {

    }

    public struct Student has key, store {
        id: UID,
        name: String,
    }

    public fun create_student(name: String, ctx: &mut TxContext) {
        let student = Student {
            id: object::new(ctx),
            name,
        };
        transfer::public_transfer(student, ctx.sender());
    }

    public struct StudentCreatedEvent has copy, drop {
        student_id: ID,
        name: String,
    }

    // Fixed function - takes name as parameter and uses event::emit
    public fun create_student_event(name: String, ctx: &mut TxContext) {
        let student = Student {
            id: object::new(ctx),
            name: name,
        };
        
        // Use event::emit instead of just emit
        event::emit(StudentCreatedEvent {
            student_id: object::uid_to_inner(&student.id),
            name: student.name,
        });
        
        transfer::public_transfer(student, ctx.sender());
    }

    public struct Certificate has key, store {
        id: UID,
        owner: address,
        course_name: String,
        grade: u8,
        date_issued: u64,
    }

    public fun mint_certificate(
        owner: address,
        course_name: String,
        grade: u8,
        date_issued: u64,
        ctx: &mut TxContext
    ) {
        let certificate = Certificate {
            id: object::new(ctx),
            owner,
            course_name,
            grade,
            date_issued,
        };
        transfer::public_transfer(certificate, ctx.sender());
    }
}