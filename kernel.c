// void main(){
//     // create a pointer to a char in the video memeroy
//     char* video_memory = (char*) 0xb8000;
//     // store char x, at the top-left. because video memory is sequential
//     *video_memory = 'X';
//     while(1);
// }
void kmain() {
    char* video_memory = (char*) 0xb8000;
    char* message = "Hello, World!";
    int i;

    for (i = 0; message[i] != '\0'; i++) {
        video_memory[i*2] = message[i];        // Character
        video_memory[i*2 + 1] = 0x0F;         // Attribute-byte: white text on black background
    }

    while(1); // Infinite loop to prevent the kernel from exiting
}
