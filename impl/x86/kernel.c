void kernel_main(void){

    // i want to define a pointer to the VGA text mode butter address
    // and then, set the value to the reffered address to x
    char* vga_address = (char*) 0xB8000;
    *vga_address = 'X';
}
