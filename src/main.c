#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int		ft_strlen(const char *str);
void	ft_bzero(void *s, size_t n);
int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_toupper(int c);
int		ft_tolower(int c);
int		ft_puts(const char *s);
char	*ft_strcat(char *s1, char *s2);
void	*ft_memset(void *b, int c, size_t len);
void	*ft_memcpy(void *restrict dst, const void *restrict src, size_t n);
void	*ft_strdup(char *s1);
void	ft_cat(int fd);

int main(void)
{
	char	hello[11] = "1234567890\0";
	int32_t	one = 0;

	one = ft_strlen(hello);
	printf("this is the value : %d\n", one);
	one = ft_isalpha(hello[1]);
	printf("this num : %c is an alpha char : %s\n", hello[1], (one ? "Yes" : "No"));
	ft_bzero(hello, one);
	printf("this is the string : %s\n", hello);
	one = ft_isalpha(25);
	printf("this num : %c is an alpha char : %s\n", 25, (one ? "Yes" : "No"));
	one = ft_isdigit(hello[1]);
	printf("this num : %c is a digit : %s\n", hello[1], (one ? "Yes" : "No"));
	one = ft_isdigit(90);
	printf("this num : %c is a digit : %s\n", 90, (one ? "Yes" : "No"));
	one = ft_isalnum('A');
	printf("this num : %c is an alnum : %s\n", 'A', (one ? "Yes" : "No"));
	one = ft_isalnum('\t');
	printf("this num : %c is an alnum : %s\n", '\t', (one ? "Yes" : "No"));
	one = ft_isascii(127);
	printf("this num : %d is ascii : %s\n", 127, (one ? "Yes" : "No"));
	one = ft_isascii(268);
	printf("this num : %d is ascii : %s\n", 268, (one ? "Yes" : "No"));
	one = ft_isprint(50);
	printf("this num : %d is print : %s\n", 50, (one ? "Yes" : "No"));
	one = ft_isprint(127);
	printf("this num : %d is print : %s\n", 127, (one ? "Yes" : "No"));
	one = ft_isprint(21);
	printf("this num : %d is print : %s\n", 21, (one ? "Yes" : "No"));
	one = ft_toupper('b');
	printf("here's your char : %c\n", one);
	one = ft_toupper('Z');
	printf("here's your char : %c\n", one);
	one = ft_tolower('a');
	printf("here's your char : %c\n", one);
	one = ft_tolower('Z');
	printf("here's your char : %c\n", one);
	one = ft_puts(hello);
	printf("Failed? %s\n", one == 4 ? "Yes" : "No");
	
	char cat[16] = "hello\0\0\0\0\0\0\0\0\0\0\0";
	char copy[16];
	char *dupme = NULL;

	printf("conacted str : %s\n", ft_strcat(cat, hello));

	printf("before memset : %s\n", cat);
	ft_memset(cat, 'A', 10);
	printf("after memset : %s\n", cat);
	ft_memset(copy, 0, 16);
	ft_memcpy(copy, cat, 16);
	printf("a null string memcpy'ed : %s\n", copy);
	dupme = ft_strdup(copy);
	printf("a string duped : %s\n", dupme);

	int	fd = 0;
	fd = open("./Makefile", O_RDONLY);
	ft_cat(fd);
	printf("\n\n\n\n");
	int64_t two = 0;
	two = read(99999, hello, 10);
	printf("error : %#llx\n", two);
	ft_cat(99999);
	return (EXIT_SUCCESS);
}
