/************************************************************************
Lab 9 Nios Software

Dong Kai Wang, Fall 2017
Christine Chen, Fall 2013

For use with ECE 385 Experiment 9
University of Illinois ECE Department
************************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "aes.h"

// Pointer to base address of AES module, make sure it matches Qsys
volatile unsigned int * AES_PTR = (unsigned int *) 0x00000100;

// Execution mode: 0 for testing, 1 for benchmarking
int run_mode = 0;

/** charToHex
 *  Convert a single character to the 4-bit value it represents.
 *  
 *  input: a character c (e.g. 'A')
 *  output: converted 4-bit value (e.g. 0xA)
 */
char charToHex(char c)
{
	char hex = c;

	if (hex >= '0' && hex <= '9')
		hex -= '0';
	else if (hex >= 'A' && hex <= 'F')
	{
		hex -= 'A';
		hex += 10;
	}
	else if (hex >= 'a' && hex <= 'f')
	{
		hex -= 'a';
		hex += 10;
	}
	return hex;
}

/** charsToHex
 *  Convert two characters to byte value it represents.
 *  Inputs must be 0-9, A-F, or a-f.
 *  
 *  input: two characters c1 and c2 (e.g. 'A' and '7')
 *  output: converted byte value (e.g. 0xA7)
 */
char charsToHex(char c1, char c2)
{
	char hex1 = charToHex(c1);
	char hex2 = charToHex(c2);
	return (hex1 << 4) + hex2;
}

/** SubWord
 *  
 *  
 *  
 *  input: word to substituted 
 *  output: substituted word
 */
unsigned long SubWord(unsigned long word)
{
	unsigned char i, j;
	unsigned long new_word = 0;
	
	int k = 0; 
	while(k < 4)
	{
		j = (unsigned char) ((word >> (k * 8)) & MASK_4);
		i = (unsigned char) ((word >> (k * 8 + 4)) & MASK_4);
		new_word = new_word | (((unsigned long) aes_sbox[i*16 + j] & MASK_3) << (k * 8));
		k++;
	}
	return new_word;
}

/** RotWord
 *  
 *  
 *  
 *  input: a 32-bit word to rotate 
 *  output: a cyclically left rotation of the word
 */
unsigned long RotWord(unsigned long word)
{	
	unsigned long first_byte = (MASK_0 & word) >> 24;
	return ((word & ~MASK_0) << 8) | first_byte;
}

/** KeyExpansion
 *  
 *  
 *  
 *  input: pointer to the key array to expand, pointer to the array to store expansion
 *  output: none
 */
 void KeyExpansion(unsigned long * key, unsigned char * key_schedule)
{
	/* Create a copy of the key array that allows byte indexing */
	unsigned char key_bytes[16];
	for (int i = 0; i < 16 ; i ++) 
	{
		int key_index = i/4;
		int byte_index = i % 4;
		key_bytes[i] = (unsigned char)(MASK_3 & (key[key_index] >> (24 - (8 * (byte_index)))));
	}
	
	/* Begin Key Expansion algorithm */
	unsigned long temp = 0;
	int i = 0; 
	
	while (i < Nk)
	{
		key_schedule[4*i] = key_bytes[4*i] ;
		key_schedule[4*i+1] = key_bytes[4*i+1] ;
		key_schedule[4*i+2] = key_bytes[4*i+2] ;
		key_schedule[4*i+3] = key_bytes[4*i+3] ;
		i++; 
	}
	
	i = Nk; 
	int j = 0; 
	while(i < Nb * (Nr + 1))
	{
		temp = ((unsigned long)key_schedule[4*i - 4] << 24) | ((unsigned long)key_schedule[4*i - 3] << 16) | ((unsigned long)key_schedule[4*i - 2] << 8) | ((unsigned long)key_schedule[4*i - 1]);
		if(i % Nk == 0)
		{
			unsigned long temp2 = RotWord(temp);
			temp = SubWord(RotWord(temp)) ^ Rcon[i/Nk];
		}

		key_schedule[4*i]   = key_schedule[(4*(i-Nk))]     ^ (temp >> 24);
		key_schedule[4*i+1] = key_schedule[(4*(i-Nk)) + 1] ^ (temp >> 16);
		key_schedule[4*i+2] = key_schedule[(4*(i-Nk)) + 2] ^ (temp >> 8);
		key_schedule[4*i+3] = key_schedule[(4*(i-Nk)) + 3] ^ (temp);
		i++;
	}
}

/** AddRoundKey
 *  
 *  
 *  
 *  input: pointer to the state array, round number and pointer to the key schedule
 *  output: none
 */
void AddRoundKey(unsigned long * state, int round, unsigned char * key_schedule)
{
	int round_index = round * 16;
	int k = 0;
	for(int i = round_index; i < round_index + 16; i = i + 4)
	{
		unsigned long xor_word = 0;
		for(int j = 0; j < 4; j++)
		{
			xor_word = (xor_word << 8) | key_schedule[i+j];
		}
		state[k] ^= xor_word;
		k++;
	}
}

/** SubBytes
 *  
 *  
 *  
 *  input: pointer to the state array
 *  output: none
 */
void SubBytes(unsigned long * state)
{
	for(int i = 0; i < 4; i++)
	{
		state[i] = SubWord(state[i]);
	}
}

/** ShiftRows
 *  
 *  
 *  
 *  input: pointer to the state array
 *  output: none 
 */
void ShiftRows(unsigned long * state)
{
	unsigned long word_0_1 = (state[0] & MASK_1) >> 16;
	unsigned long word_0_2 = (state[0] & MASK_2) >> 8;
	unsigned long word_0_3 = (state[0] & MASK_3);

	unsigned long word_1_1 = (state[1] & MASK_1) >> 16;
	unsigned long word_1_2 = (state[1] & MASK_2) >> 8;
	unsigned long word_1_3 = (state[1] & MASK_3);

	unsigned long word_2_1 = (state[2] & MASK_1) >> 16;
	unsigned long word_2_2 = (state[2] & MASK_2) >> 8;
	unsigned long word_2_3 = (state[2] & MASK_3);

	unsigned long word_3_1 = (state[3] & MASK_1) >> 16;
	unsigned long word_3_2 = (state[3] & MASK_2) >> 8;
	unsigned long word_3_3 = (state[3] & MASK_3);

	state[0]= (state[0] & ~(MASK_1)) | word_1_1 << 16;
	state[1]= (state[1] & ~(MASK_1)) | word_2_1 << 16;
	state[2]= (state[2] & ~(MASK_1)) | word_3_1 << 16;
	state[3]= (state[3] & ~(MASK_1)) | word_0_1 << 16;

	state[0]= (state[0] & ~(MASK_2)) | word_2_2 << 8;
	state[1]= (state[1] & ~(MASK_2)) | word_3_2 << 8;
	state[2]= (state[2] & ~(MASK_2)) | word_0_2 << 8;
	state[3]= (state[3] & ~(MASK_2)) | word_1_2 << 8;

	state[0]= (state[0] & ~(MASK_3)) | word_3_3;
	state[1]= (state[1] & ~(MASK_3)) | word_0_3;
	state[2]= (state[2] & ~(MASK_3)) | word_1_3;
	state[3]= (state[3] & ~(MASK_3)) | word_2_3;
}


/* Mix Columns helper function */
unsigned char xtime(unsigned long byte)
{
	return gf_mul[(unsigned char) byte][0];
}

/** MixColumns
 *  
 *  
 *  
 *  input: 
 *  output: 
 */
void MixColumns(unsigned long * state)
{
	for(int i = 0; i < 4; i++)
	{
		unsigned long byte_0 = (state[i] & MASK_0) >> 24;
		unsigned long byte_1 = (state[i] & MASK_1) >> 16;
		unsigned long byte_2 = (state[i] & MASK_2) >> 8;
		unsigned long byte_3 = (state[i] & MASK_3);

		state[i] = (~MASK_0 & state[i]) | ((xtime(byte_0) ^ (xtime(byte_1) ^ byte_1) ^ byte_2 ^ byte_3) << 24);
		state[i] = (~MASK_1 & state[i]) | ((byte_0 ^ xtime(byte_1) ^ (xtime(byte_2) ^ byte_2) ^ byte_3) << 16);
		state[i] = (~MASK_2 & state[i]) | ((byte_0 ^ byte_1 ^ xtime(byte_2) ^ (xtime(byte_3) ^ byte_3)) << 8);
		state[i] = (~MASK_3 & state[i]) | (((xtime(byte_0) ^ byte_0) ^ byte_1 ^ byte_2 ^ xtime(byte_3)));
	}
}
/* DEBUG FUNCTIONS*/
void print_state(unsigned long * state)
{
	for(int i = 0; i < 4; i++)
	{
		printf("%08lX ", state[i]);
		printf("\n");
	}
}

void print_key_schedule(unsigned char * key_schedule)
{
	for(int i = 0; i < 44; i++)
	{
		for(int j = 0; j < 4; j++)
		{
			printf("%02X ", key_schedule[i*4 + j]);
		}
		printf("\n");
	}
}

void test()
{
	/* Get the Key Schedule */
	unsigned long key[4]=
	{
		0x00010203,
		0x04050607,
		0x08090A0B,
		0x0C0D0E0F
	};

	unsigned long state[4]=
	{
		0xECE298DC,
		0xECE298DC,
		0xECE298DC,
		0xECE298DC
	};

	unsigned char key_schedule[4 * (Nb * (Nr + 1))]; 
	KeyExpansion(key, key_schedule);

	printf("KEY EXPANSION: \n");
	print_key_schedule(key_schedule);
	printf("\n");

	/* Add the first round key */
	AddRoundKey(state, 0, key_schedule);

	printf("ROUND 0 STATE: \n");
	print_state(state);

	/* Perform nine full rounds of AES algorithm */
	for (int round = 1; round < Nr; round++) 
	{
		printf("\n");
		SubBytes(state);

		printf("AFTER SUB_BYTES: \n");
		print_state(state);
		printf("\n");

		ShiftRows(state);

		printf("AFTER SHIFT_ROWS: \n");
		print_state(state);
		printf("\n");

		MixColumns(state);

		printf("AFTER MIX_COLUMNS: \n");
		print_state(state);
		printf("\n");

		AddRoundKey(state, round, key_schedule);

		printf("ROUND %i STATE: \n", round);
		print_state(state);
	}

	printf("\n");
	printf("FINAL ROUND:\n");

	/* Perform final round of AES algorithm */
	SubBytes(state);
	printf("AFTER SUB_BYTES: \n");
	print_state(state);
	printf("\n");

	ShiftRows(state);

	printf("AFTER SHIFT_ROWS: \n");
	print_state(state);
	printf("\n");

	AddRoundKey(state, Nr, key_schedule);
	printf("FINAL ROUND STATE: \n");
	print_state(state);
}

// Perform AES Encryption in Software
void encrypt(unsigned char * plaintext_asc, unsigned char * key_asc, unsigned long * state, unsigned long * key)
{
	/* clear the state and key arrays */
	for (int i = 0; i < 4 ; i ++) 
	{
		state[i] = 0;
		key[i] = 0;
	}
	
	/* Set the state and the key values */
	for (int i = 0; i <= 30; i = i + 2) 
	{
		int word = i/8; 
		char state_hex = charsToHex(plaintext_asc[i], plaintext_asc[i + 1]);
		char key_hex = charsToHex(key_asc[i], key_asc[i + 1]);
		
		state[word] = (state[word] << 8) | state_hex; 
		key[word] = (key[word] << 8) | key_hex; 
	}
	
	/* Get the Key Schedule */
	unsigned char key_schedule[4 * (Nb * (Nr + 1))]; 
	KeyExpansion(key, key_schedule);
	
	/* Add the first round key */
	AddRoundKey(state, 0, key_schedule);
	
	/* Perform nine full rounds of AES algorithm */
	for (int round = 1; round < Nr; round++) 
	{
		SubBytes(state);
		ShiftRows(state);
		MixColumns(state);
		AddRoundKey(state, round, key_schedule);
	}
	
	/* Perform final round of AES algorithm */
	SubBytes(state);
	ShiftRows(state);
	AddRoundKey(state, Nr, key_schedule);
}

// Perform AES Decryption in Hardware
void decrypt(unsigned long * state, unsigned long * key)
{
	return;
}

int main()
{
	// Input Message and Key as 32x 8bit ASCII Characters ([33] is for NULL terminator)
	unsigned char plaintext_asc[33];
	unsigned char key_asc[33];
	// Key and Encrypted Message in 4x 32bit Format
	unsigned long state[4];
	unsigned long key[4];

	test();
	// printf("Select execution mode: 0 for testing, 1 for benchmarking: ");
	// scanf("%d", &run_mode);

	// if (run_mode == 0) {
	// 	while (1) {
	// 		int i = 0;
	// 		printf("\nEnter plain text:\n");
	// 		scanf("%s", plaintext_asc);
	// 		printf("\n");
	// 		printf("\nEnter key:\n");
	// 		scanf("%s", key_asc);
	// 		printf("\n");
	// 		encrypt(plaintext_asc, key_asc, state, key);
	// 		printf("\nEncrpted message is: \n");
	// 		for(i = 0; i < 4; i++){
	// 			printf("%08lX\n", state[i]);
	// 		}
	// 		decrypt(state, key);
	// 		printf("\nDecrypted message is: \n");
	// 		for(i = 0; i < 4; i++){
	// 			printf("%08lX\n", state[i]);
	// 		}
	// 	}
	// }
	// else {
	// 	int i = 0;
	// 	int size_KB = 1;
	// 	for (i = 0; i < 32; i++) {
	// 		plaintext_asc[i] = 'a';
	// 		key_asc[i] = 'b';
	// 	}

	// 	clock_t begin = clock();
	// 	for (i = 0; i < size_KB * 128; i++)
	// 		encrypt(plaintext_asc, key_asc, state, key);
	// 	clock_t end = clock();
	// 	double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	// 	double speed = size_KB / time_spent;

	// 	printf("Software Encryption Speed: %f KB/s \n", speed);

	// 	begin = clock();
	// 	for (i = 0; i < size_KB * 128; i++)
	// 		decrypt(state, key);
	// 	end = clock();
	// 	time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	// 	speed = size_KB / time_spent;

	// 	printf("Hardware Encryption Speed: %f KB/s \n", speed);
	// }
	return 0;
}
