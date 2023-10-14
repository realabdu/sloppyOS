
// define a pointer, that points to addresss of the video memroy.
char* video_memory = 0x8000;


// we change the value of that address
*video_memeory = 'X';

// notice that the value of the pointer is still unchanged, we have just changed the value
// that pointer is pointing too
// video_memeroy ='X';
// if we were to do this, we would change the value of the pointer. with an ASCII. DONT DO THIS
