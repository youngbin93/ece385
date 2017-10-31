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
 *  input: 
 *  output: 
 */
unsigned long SubWord(unsigned long word)
{
	unsigned char i, j;
	hbyte_mask = 0x0000000F;
	byte_mask = 0x000000FF;
	unsigned long new_word = 0;
	
	int k = 0; 
	while(k < 4)
	{
		i = (unsigned char) ((word >> (k * 8)) & hbyte_mask);
		j = (unsigned char) ((word >> (k * 8 + 4)) & hbyte_mask);
		new_word = new_word | (((unsigned long) aes_sbox[i*16 + j] & byte_mask) << (k * 8));
		k++;
	}
	return new_word;
}

/** RotWord
 *  
 *  
 *  
 *  input: a 32-bit word
 *  output: a cyclically left rotation of the word
 */
unsigned long RotWord(unsigned long word)
{
	byte_mask = 0x000000FF;
	return ((word >> 16) & byte_mask) | ((word >> 8) & byte_mask) | ((word) & byte_mask) | ((word >> 24) & byte_mask);
}

/** KeyExpansion
 *  
 *  
 *  
 *  input: 
 *  output: 
 */
 void KeyExpansion(unsigned long * key, unsigned char * key_schedule)
{
	/* Create a copy of the key array that allows byte indexing */
	unsigned char key_bytes[16];
	byte_mask = 0x000000FF
	for (int i = 0; i < 16 ; i ++) 
	{
		int key_index = i/4;
		int byte_index = i % 4;
		key_bytes[i] = (unsigned char)(byte_mask & (key[key_index] >> (24 - (8 * (byte_index)))));
	}
	
	/* Begin Key Expansion algorithm */
	unsigned long temp = 0;
	i = 0; 
	
	while (i < Nk)
	{
		key_schedule[4*i] = key_bytes[4*i] ;
		key_schedule[4*i+1] = key_bytes[4*i+1] ;
		key_schedule[4*i+2] = key_bytes[4*i+2] ;
		key_schedule[4*i+3] = key_bytes[4*i+3] ;
		i++; 
	}
	
	i = Nk; 
	
	while(i < Nb * (Nr + 1))
	{
		temp = ((unsigned long)key_schedule[i - 4] << 24) | ((unsigned long)key_schedule[i - 3] << 16) | ((unsigned long)key_schedule[i - 2] << 8) | ((unsigned long)key_schedule[i - 1]);
		
		if(i % Nk == 0)
		{
			temp = SubWord(RotWord(temp)) ^ Rcon[i/Nk];
		}
		
		key_schedule[4*i] = key_schedule  [(4*i)- Nk]   ^ (temp >> 24);
		key_schedule[4*i+1] = key_schedule[(4*i+1)- Nk] ^ (temp >> 16);
		key_schedule[4*i+2] = key_schedule[(4*i+2)- Nk] ^ (temp >> 8);
		key_schedule[4*i+3] = key_schedule[(4*i+3)- Nk] ^ (temp);
		i++;
	}
}

/** AddRoundKey
 *  
 *  
 *  
 *  input: 
 *  output: 
 */
void AddRoundKey(unsigned long * state, int round, unsigned char * key_schedule)
{
	for(int j = 0; j < 4; j++)
	{
		unsigned long xor_word = 0; 
		for(int i = (round * 4) + (j * 4); i < (round * 4) + (j * 4) + 4; i++)
		{
			xor_word = (xor_word << 8) | key_schedule[i];
		}

		state[j] ^= xor_word;
	}
}

/** SubBytes
 *  
 *  
 *  
 *  input: 
 *  output: 
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
 *  input: 
 *  output: 
 */
void ShiftRows(unsigned long * state)
{
	return;
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
	return;
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

	printf("Select execution mode: 0 for testing, 1 for benchmarking: ");
	scanf("%d", &run_mode);

	if (run_mode == 0) {
		while (1) {
			int i = 0;
			printf("\nEnter plain text:\n");
			scanf("%s", plaintext_asc);
			printf("\n");
			printf("\nEnter key:\n");
			scanf("%s", key_asc);
			printf("\n");
			encrypt(plaintext_asc, key_asc, state, key);
			printf("\nEncrpted message is: \n");
			for(i = 0; i < 4; i++){
				printf("%08lX\n", state[i])
			}
			decrypt(state, key);
			printf("\nDecrypted message is: \n");
			for(i = 0; i < 4; i++){
				printf("%08lX\n", state[i])
			}
		}
	}
	else {
		int i = 0;
		int size_KB = 1;
		for (i = 0; i < 32; i++) {
			plaintext_asc[i] = 'a';
			key_asc[i] = 'b';
		}

		clock_t begin = clock();
		for (i = 0; i < size_KB * 128; i++)
			encrypt(plaintext_asc, key_asc, state, key);
		clock_t end = clock();
		double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		double speed = size_KB / time_spent;

		printf("Software Encryption Speed: %f KB/s \n", speed);

		begin = clock();
		for (i = 0; i < size_KB * 128; i++)
			decrypt(state, key);
		end = clock();
		time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		speed = size_KB / time_spent;

		printf("Hardware Encryption Speed: %f KB/s \n", speed);
	}
	return 0;
}