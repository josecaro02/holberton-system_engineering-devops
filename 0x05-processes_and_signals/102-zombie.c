#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
/**
 *infinite_while - makes an infinite loop
 *
 *Return: 0 success
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 *main - creates 5 zombie process
 *
 *Return: 0 success
 */
int main(void)
{
	pid_t zom_pid;
	int i;

	for (i = 0; i < 5; i++)
	{
		zom_pid = fork();
		if (zom_pid <= 0)
			return (0);
		printf("Zombie process created, PID: %d\n", zom_pid);
	}
	infinite_while();
	return (0);
}
