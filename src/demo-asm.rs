#[link_args="asm.o c.o"]
extern "C" {
    fn getValueFromASM() -> libc::c_long;
    fn getValueFromC() -> libc::c_long;
}

fn main(){
    let a, b: i64;
    unsafe {
        a = getValueFromASM();
        b = getValueFromC();
    }
    println(fmt!("Value from ASM (should be 46543): %?",a));
    println(fmt!("Value from C (should be 240489203): %?",b));
}