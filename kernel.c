void kmain(){
    // create a pointer to a char in the video memeroy
    char* video_memory = (char*) 0xb8000;
    // store char x, at the top-left. because video memory is sequential
    *video_memory = 'X';
}
