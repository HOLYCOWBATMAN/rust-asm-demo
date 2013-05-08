#[link_args="asm.o"]
extern "C" {
    fn getValueFromASM() -> libc::c_long;
}

fn main(){
    let a: i64;
    unsafe {
        a = getValueFromASM();
    }
    println(fmt!("Value from ASM (should be 46543): %?",a));
}