
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = {"sh", 0};

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
	int pid, wpid;

	if (open("console", O_RDWR) < 0) {
   a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  11:	00 
  12:	c7 04 24 46 08 00 00 	movl   $0x846,(%esp)
  19:	e8 ba 03 00 00       	call   3d8 <open>
  1e:	85 c0                	test   %eax,%eax
  20:	0f 88 ac 00 00 00    	js     d2 <main+0xd2>
		mknod("console", 1, 1);
		open("console", O_RDWR);
	}
	dup(0); // stdout
  26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2d:	e8 de 03 00 00       	call   410 <dup>
	dup(0); // stderr
  32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  39:	e8 d2 03 00 00       	call   410 <dup>
  3e:	66 90                	xchg   %ax,%ax

	for (;;) {
		printf(1, "init: starting sh\n");
  40:	c7 44 24 04 4e 08 00 	movl   $0x84e,0x4(%esp)
  47:	00 
  48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4f:	e8 8c 04 00 00       	call   4e0 <printf>
		pid = fork();
  54:	e8 37 03 00 00       	call   390 <fork>
		if (pid < 0) {
  59:	85 c0                	test   %eax,%eax
	dup(0); // stdout
	dup(0); // stderr

	for (;;) {
		printf(1, "init: starting sh\n");
		pid = fork();
  5b:	89 c3                	mov    %eax,%ebx
		if (pid < 0) {
  5d:	78 2d                	js     8c <main+0x8c>
  5f:	90                   	nop
			printf(1, "init: fork failed\n");
			exit();
		}
		if (pid == 0) {
  60:	74 43                	je     a5 <main+0xa5>
  62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			exec("sh", argv);
			printf(1, "init: exec sh failed\n");
			exit();
		}
		while ((wpid = wait()) >= 0 && wpid != pid) printf(1, "zombie!\n");
  68:	e8 33 03 00 00       	call   3a0 <wait>
  6d:	85 c0                	test   %eax,%eax
  6f:	90                   	nop
  70:	78 ce                	js     40 <main+0x40>
  72:	39 d8                	cmp    %ebx,%eax
  74:	74 ca                	je     40 <main+0x40>
  76:	c7 44 24 04 8d 08 00 	movl   $0x88d,0x4(%esp)
  7d:	00 
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	e8 56 04 00 00       	call   4e0 <printf>
  8a:	eb dc                	jmp    68 <main+0x68>

	for (;;) {
		printf(1, "init: starting sh\n");
		pid = fork();
		if (pid < 0) {
			printf(1, "init: fork failed\n");
  8c:	c7 44 24 04 61 08 00 	movl   $0x861,0x4(%esp)
  93:	00 
  94:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9b:	e8 40 04 00 00       	call   4e0 <printf>
			exit();
  a0:	e8 f3 02 00 00       	call   398 <exit>
		}
		if (pid == 0) {
			exec("sh", argv);
  a5:	c7 44 24 04 4c 0b 00 	movl   $0xb4c,0x4(%esp)
  ac:	00 
  ad:	c7 04 24 74 08 00 00 	movl   $0x874,(%esp)
  b4:	e8 17 03 00 00       	call   3d0 <exec>
			printf(1, "init: exec sh failed\n");
  b9:	c7 44 24 04 77 08 00 	movl   $0x877,0x4(%esp)
  c0:	00 
  c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c8:	e8 13 04 00 00       	call   4e0 <printf>
			exit();
  cd:	e8 c6 02 00 00       	call   398 <exit>
main(void)
{
	int pid, wpid;

	if (open("console", O_RDWR) < 0) {
		mknod("console", 1, 1);
  d2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  d9:	00 
  da:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  e1:	00 
  e2:	c7 04 24 46 08 00 00 	movl   $0x846,(%esp)
  e9:	e8 f2 02 00 00       	call   3e0 <mknod>
		open("console", O_RDWR);
  ee:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  f5:	00 
  f6:	c7 04 24 46 08 00 00 	movl   $0x846,(%esp)
  fd:	e8 d6 02 00 00       	call   3d8 <open>
 102:	e9 1f ff ff ff       	jmp    26 <main+0x26>
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "pstat.h"//include


char *
strcpy(char *s, char *t)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 119:	53                   	push   %ebx
	char *os;

	os = s;
	while ((*s++ = *t++) != 0)
 11a:	89 c2                	mov    %eax,%edx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 120:	83 c1 01             	add    $0x1,%ecx
 123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 127:	83 c2 01             	add    $0x1,%edx
 12a:	84 db                	test   %bl,%bl
 12c:	88 5a ff             	mov    %bl,-0x1(%edx)
 12f:	75 ef                	jne    120 <strcpy+0x10>
		;
	return os;
}
 131:	5b                   	pop    %ebx
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 55 08             	mov    0x8(%ebp),%edx
 146:	53                   	push   %ebx
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
	while (*p && *p == *q) p++, q++;
 14a:	0f b6 02             	movzbl (%edx),%eax
 14d:	84 c0                	test   %al,%al
 14f:	74 2d                	je     17e <strcmp+0x3e>
 151:	0f b6 19             	movzbl (%ecx),%ebx
 154:	38 d8                	cmp    %bl,%al
 156:	74 0e                	je     166 <strcmp+0x26>
 158:	eb 2b                	jmp    185 <strcmp+0x45>
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	38 c8                	cmp    %cl,%al
 162:	75 15                	jne    179 <strcmp+0x39>
 164:	89 d9                	mov    %ebx,%ecx
 166:	83 c2 01             	add    $0x1,%edx
 169:	0f b6 02             	movzbl (%edx),%eax
 16c:	8d 59 01             	lea    0x1(%ecx),%ebx
 16f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 173:	84 c0                	test   %al,%al
 175:	75 e9                	jne    160 <strcmp+0x20>
 177:	31 c0                	xor    %eax,%eax
	return (uchar)*p - (uchar)*q;
 179:	29 c8                	sub    %ecx,%eax
}
 17b:	5b                   	pop    %ebx
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret    
 17e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q) p++, q++;
 181:	31 c0                	xor    %eax,%eax
 183:	eb f4                	jmp    179 <strcmp+0x39>
 185:	0f b6 cb             	movzbl %bl,%ecx
 188:	eb ef                	jmp    179 <strcmp+0x39>
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <strlen>:
	return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	for (n = 0; s[n]; n++)
 196:	80 39 00             	cmpb   $0x0,(%ecx)
 199:	74 12                	je     1ad <strlen+0x1d>
 19b:	31 d2                	xor    %edx,%edx
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	83 c2 01             	add    $0x1,%edx
 1a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1a7:	89 d0                	mov    %edx,%eax
 1a9:	75 f5                	jne    1a0 <strlen+0x10>
		;
	return n;
}
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
uint
strlen(char *s)
{
	int n;

	for (n = 0; s[n]; n++)
 1ad:	31 c0                	xor    %eax,%eax
		;
	return n;
}
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	eb 0d                	jmp    1c0 <memset>
 1b3:	90                   	nop
 1b4:	90                   	nop
 1b5:	90                   	nop
 1b6:	90                   	nop
 1b7:	90                   	nop
 1b8:	90                   	nop
 1b9:	90                   	nop
 1ba:	90                   	nop
 1bb:	90                   	nop
 1bc:	90                   	nop
 1bd:	90                   	nop
 1be:	90                   	nop
 1bf:	90                   	nop

000001c0 <memset>:

void *
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
 1c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb" : "=D"(addr), "=c"(cnt) : "0"(addr), "1"(cnt), "a"(data) : "memory", "cc");
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
	stosb(dst, c, n);
	return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char *
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	53                   	push   %ebx
 1e7:	8b 55 0c             	mov    0xc(%ebp),%edx
	for (; *s; s++)
 1ea:	0f b6 18             	movzbl (%eax),%ebx
 1ed:	84 db                	test   %bl,%bl
 1ef:	74 1d                	je     20e <strchr+0x2e>
		if (*s == c) return (char *)s;
 1f1:	38 d3                	cmp    %dl,%bl
 1f3:	89 d1                	mov    %edx,%ecx
 1f5:	75 0d                	jne    204 <strchr+0x24>
 1f7:	eb 17                	jmp    210 <strchr+0x30>
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	38 ca                	cmp    %cl,%dl
 202:	74 0c                	je     210 <strchr+0x30>
}

char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 204:	83 c0 01             	add    $0x1,%eax
 207:	0f b6 10             	movzbl (%eax),%edx
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strchr+0x20>
		if (*s == c) return (char *)s;
	return 0;
 20e:	31 c0                	xor    %eax,%eax
}
 210:	5b                   	pop    %ebx
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <gets>:

char *
gets(char *buf, int max)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 225:	31 f6                	xor    %esi,%esi
	return 0;
}

char *
gets(char *buf, int max)
{
 227:	53                   	push   %ebx
 228:	83 ec 2c             	sub    $0x2c,%esp
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
 22b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 22e:	eb 31                	jmp    261 <gets+0x41>
		cc = read(0, &c, 1);
 230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 237:	00 
 238:	89 7c 24 04          	mov    %edi,0x4(%esp)
 23c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 243:	e8 68 01 00 00       	call   3b0 <read>
		if (cc < 1) break;
 248:	85 c0                	test   %eax,%eax
 24a:	7e 1d                	jle    269 <gets+0x49>
		buf[i++] = c;
 24c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 250:	89 de                	mov    %ebx,%esi
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
 252:	8b 55 08             	mov    0x8(%ebp),%edx
		if (c == '\n' || c == '\r') break;
 255:	3c 0d                	cmp    $0xd,%al
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
 257:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
		if (c == '\n' || c == '\r') break;
 25b:	74 0c                	je     269 <gets+0x49>
 25d:	3c 0a                	cmp    $0xa,%al
 25f:	74 08                	je     269 <gets+0x49>
gets(char *buf, int max)
{
	int  i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 261:	8d 5e 01             	lea    0x1(%esi),%ebx
 264:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 267:	7c c7                	jl     230 <gets+0x10>
		cc = read(0, &c, 1);
		if (cc < 1) break;
		buf[i++] = c;
		if (c == '\n' || c == '\r') break;
	}
	buf[i] = '\0';
 269:	8b 45 08             	mov    0x8(%ebp),%eax
 26c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
	return buf;
}
 270:	83 c4 2c             	add    $0x2c,%esp
 273:	5b                   	pop    %ebx
 274:	5e                   	pop    %esi
 275:	5f                   	pop    %edi
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
 278:	90                   	nop
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <stat>:

int
stat(char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
 285:	83 ec 10             	sub    $0x10,%esp
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 292:	00 
 293:	89 04 24             	mov    %eax,(%esp)
 296:	e8 3d 01 00 00       	call   3d8 <open>
	if (fd < 0) return -1;
 29b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 29d:	89 c3                	mov    %eax,%ebx
	if (fd < 0) return -1;
 29f:	78 27                	js     2c8 <stat+0x48>
	r = fstat(fd, st);
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	89 1c 24             	mov    %ebx,(%esp)
 2a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ab:	e8 40 01 00 00       	call   3f0 <fstat>
	close(fd);
 2b0:	89 1c 24             	mov    %ebx,(%esp)
	int fd;
	int r;

	fd = open(n, O_RDONLY);
	if (fd < 0) return -1;
	r = fstat(fd, st);
 2b3:	89 c6                	mov    %eax,%esi
	close(fd);
 2b5:	e8 06 01 00 00       	call   3c0 <close>
	return r;
 2ba:	89 f0                	mov    %esi,%eax
}
 2bc:	83 c4 10             	add    $0x10,%esp
 2bf:	5b                   	pop    %ebx
 2c0:	5e                   	pop    %esi
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	90                   	nop
 2c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	int fd;
	int r;

	fd = open(n, O_RDONLY);
	if (fd < 0) return -1;
 2c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2cd:	eb ed                	jmp    2bc <stat+0x3c>
 2cf:	90                   	nop

000002d0 <atoi>:
	return r;
}

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d6:	53                   	push   %ebx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9') n= n * 10 + *s++ - '0';
 2d7:	0f be 11             	movsbl (%ecx),%edx
 2da:	8d 42 d0             	lea    -0x30(%edx),%eax
 2dd:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
	int n;

	n = 0;
 2df:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9') n= n * 10 + *s++ - '0';
 2e4:	77 17                	ja     2fd <atoi+0x2d>
 2e6:	66 90                	xchg   %ax,%ax
 2e8:	83 c1 01             	add    $0x1,%ecx
 2eb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2ee:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 2f2:	0f be 11             	movsbl (%ecx),%edx
 2f5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2f8:	80 fb 09             	cmp    $0x9,%bl
 2fb:	76 eb                	jbe    2e8 <atoi+0x18>
	return n;
}
 2fd:	5b                   	pop    %ebx
 2fe:	5d                   	pop    %ebp
 2ff:	c3                   	ret    

00000300 <memmove>:

void *
memmove(void *vdst, void *vsrc, int n)
{
 300:	55                   	push   %ebp
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0) *dst++= *src++;
 301:	31 d2                	xor    %edx,%edx
	return n;
}

void *
memmove(void *vdst, void *vsrc, int n)
{
 303:	89 e5                	mov    %esp,%ebp
 305:	56                   	push   %esi
 306:	8b 45 08             	mov    0x8(%ebp),%eax
 309:	53                   	push   %ebx
 30a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 30d:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0) *dst++= *src++;
 310:	85 db                	test   %ebx,%ebx
 312:	7e 12                	jle    326 <memmove+0x26>
 314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 318:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 31c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 31f:	83 c2 01             	add    $0x1,%edx
 322:	39 da                	cmp    %ebx,%edx
 324:	75 f2                	jne    318 <memmove+0x18>
	return vdst;
}
 326:	5b                   	pop    %ebx
 327:	5e                   	pop    %esi
 328:	5d                   	pop    %ebp
 329:	c3                   	ret    
 32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000330 <ps>:

//edit
void ps(void){
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
	int which = 1;
 335:	bb 01 00 00 00       	mov    $0x1,%ebx
	while (n-- > 0) *dst++= *src++;
	return vdst;
}

//edit
void ps(void){
 33a:	83 ec 40             	sub    $0x40,%esp
 33d:	8d 75 dc             	lea    -0x24(%ebp),%esi
 340:	eb 37                	jmp    379 <ps+0x49>
 342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
 348:	0f be 45 ec          	movsbl -0x14(%ebp),%eax
	which++;
 34c:	83 c3 01             	add    $0x1,%ebx
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
 34f:	89 74 24 14          	mov    %esi,0x14(%esp)
 353:	c7 44 24 04 96 08 00 	movl   $0x896,0x4(%esp)
 35a:	00 
 35b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 362:	89 44 24 10          	mov    %eax,0x10(%esp)
 366:	8b 45 f4             	mov    -0xc(%ebp),%eax
 369:	89 44 24 0c          	mov    %eax,0xc(%esp)
 36d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 370:	89 44 24 08          	mov    %eax,0x8(%esp)
 374:	e8 67 01 00 00       	call   4e0 <printf>
//edit
void ps(void){
	int which = 1;
	struct pstat pnode;
	while(1){
	if(procstat (which, &pnode))break;
 379:	89 74 24 04          	mov    %esi,0x4(%esp)
 37d:	89 1c 24             	mov    %ebx,(%esp)
 380:	e8 b3 00 00 00       	call   438 <procstat>
 385:	85 c0                	test   %eax,%eax
 387:	74 bf                	je     348 <ps+0x18>

	printf(1, "%d, %d, %c, %s\n",pnode.pid, pnode.ppid, pnode.state, pnode.name);
	which++;
	}
}
 389:	83 c4 40             	add    $0x40,%esp
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5d                   	pop    %ebp
 38f:	c3                   	ret    

00000390 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 390:	b8 01 00 00 00       	mov    $0x1,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <exit>:
SYSCALL(exit)
 398:	b8 02 00 00 00       	mov    $0x2,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <wait>:
SYSCALL(wait)
 3a0:	b8 03 00 00 00       	mov    $0x3,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <pipe>:
SYSCALL(pipe)
 3a8:	b8 04 00 00 00       	mov    $0x4,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <read>:
SYSCALL(read)
 3b0:	b8 05 00 00 00       	mov    $0x5,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <write>:
SYSCALL(write)
 3b8:	b8 10 00 00 00       	mov    $0x10,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <close>:
SYSCALL(close)
 3c0:	b8 15 00 00 00       	mov    $0x15,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <kill>:
SYSCALL(kill)
 3c8:	b8 06 00 00 00       	mov    $0x6,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <exec>:
SYSCALL(exec)
 3d0:	b8 07 00 00 00       	mov    $0x7,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <open>:
SYSCALL(open)
 3d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <mknod>:
SYSCALL(mknod)
 3e0:	b8 11 00 00 00       	mov    $0x11,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <unlink>:
SYSCALL(unlink)
 3e8:	b8 12 00 00 00       	mov    $0x12,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <fstat>:
SYSCALL(fstat)
 3f0:	b8 08 00 00 00       	mov    $0x8,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <link>:
SYSCALL(link)
 3f8:	b8 13 00 00 00       	mov    $0x13,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <mkdir>:
SYSCALL(mkdir)
 400:	b8 14 00 00 00       	mov    $0x14,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <chdir>:
SYSCALL(chdir)
 408:	b8 09 00 00 00       	mov    $0x9,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <dup>:
SYSCALL(dup)
 410:	b8 0a 00 00 00       	mov    $0xa,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <getpid>:
SYSCALL(getpid)
 418:	b8 0b 00 00 00       	mov    $0xb,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <sbrk>:
SYSCALL(sbrk)
 420:	b8 0c 00 00 00       	mov    $0xc,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <sleep>:
SYSCALL(sleep)
 428:	b8 0d 00 00 00       	mov    $0xd,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <uptime>:
SYSCALL(uptime)
 430:	b8 0e 00 00 00       	mov    $0xe,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <procstat>:
SYSCALL(procstat)
 438:	b8 16 00 00 00       	mov    $0x16,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	89 c6                	mov    %eax,%esi
 447:	53                   	push   %ebx
 448:	83 ec 4c             	sub    $0x4c,%esp
	char        buf[16];
	int         i, neg;
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
 44b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 44e:	85 db                	test   %ebx,%ebx
 450:	74 09                	je     45b <printint+0x1b>
 452:	89 d0                	mov    %edx,%eax
 454:	c1 e8 1f             	shr    $0x1f,%eax
 457:	84 c0                	test   %al,%al
 459:	75 75                	jne    4d0 <printint+0x90>
		neg = 1;
		x   = -xx;
	} else {
		x = xx;
 45b:	89 d0                	mov    %edx,%eax
	static char digits[] = "0123456789ABCDEF";
	char        buf[16];
	int         i, neg;
	uint        x;

	neg = 0;
 45d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 464:	89 75 c0             	mov    %esi,-0x40(%ebp)
		x   = -xx;
	} else {
		x = xx;
	}

	i = 0;
 467:	31 ff                	xor    %edi,%edi
 469:	89 ce                	mov    %ecx,%esi
 46b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 46e:	eb 02                	jmp    472 <printint+0x32>
	do {
		buf[i++] = digits[x % base];
 470:	89 cf                	mov    %ecx,%edi
 472:	31 d2                	xor    %edx,%edx
 474:	f7 f6                	div    %esi
 476:	8d 4f 01             	lea    0x1(%edi),%ecx
 479:	0f b6 92 ad 08 00 00 	movzbl 0x8ad(%edx),%edx
	} while ((x /= base) != 0);
 480:	85 c0                	test   %eax,%eax
		x = xx;
	}

	i = 0;
	do {
		buf[i++] = digits[x % base];
 482:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
	} while ((x /= base) != 0);
 485:	75 e9                	jne    470 <printint+0x30>
	if (neg) buf[i++] = '-';
 487:	8b 55 c4             	mov    -0x3c(%ebp),%edx
		x = xx;
	}

	i = 0;
	do {
		buf[i++] = digits[x % base];
 48a:	89 c8                	mov    %ecx,%eax
 48c:	8b 75 c0             	mov    -0x40(%ebp),%esi
	} while ((x /= base) != 0);
	if (neg) buf[i++] = '-';
 48f:	85 d2                	test   %edx,%edx
 491:	74 08                	je     49b <printint+0x5b>
 493:	8d 4f 02             	lea    0x2(%edi),%ecx
 496:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

	while (--i >= 0) putc(fd, buf[i]);
 49b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 49e:	66 90                	xchg   %ax,%ax
 4a0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 4a5:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4af:	00 
 4b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4b4:	89 34 24             	mov    %esi,(%esp)
 4b7:	88 45 d7             	mov    %al,-0x29(%ebp)
 4ba:	e8 f9 fe ff ff       	call   3b8 <write>
	do {
		buf[i++] = digits[x % base];
	} while ((x /= base) != 0);
	if (neg) buf[i++] = '-';

	while (--i >= 0) putc(fd, buf[i]);
 4bf:	83 ff ff             	cmp    $0xffffffff,%edi
 4c2:	75 dc                	jne    4a0 <printint+0x60>
}
 4c4:	83 c4 4c             	add    $0x4c,%esp
 4c7:	5b                   	pop    %ebx
 4c8:	5e                   	pop    %esi
 4c9:	5f                   	pop    %edi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
		x   = -xx;
 4d0:	89 d0                	mov    %edx,%eax
 4d2:	f7 d8                	neg    %eax
	int         i, neg;
	uint        x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
 4d4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4db:	eb 87                	jmp    464 <printint+0x24>
 4dd:	8d 76 00             	lea    0x0(%esi),%esi

000004e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
 4e4:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4e6:	56                   	push   %esi
 4e7:	53                   	push   %ebx
 4e8:	83 ec 3c             	sub    $0x3c,%esp
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 4eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
 4ee:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4f1:	8b 75 08             	mov    0x8(%ebp),%esi
	char *s;
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
 4f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	for (i = 0; fmt[i]; i++) {
 4f7:	0f b6 13             	movzbl (%ebx),%edx
 4fa:	83 c3 01             	add    $0x1,%ebx
 4fd:	84 d2                	test   %dl,%dl
 4ff:	75 39                	jne    53a <printf+0x5a>
 501:	e9 c2 00 00 00       	jmp    5c8 <printf+0xe8>
 506:	66 90                	xchg   %ax,%ax
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
 508:	83 fa 25             	cmp    $0x25,%edx
 50b:	0f 84 bf 00 00 00    	je     5d0 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 511:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 514:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 51b:	00 
 51c:	89 44 24 04          	mov    %eax,0x4(%esp)
 520:	89 34 24             	mov    %esi,(%esp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
 523:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 526:	e8 8d fe ff ff       	call   3b8 <write>
 52b:	83 c3 01             	add    $0x1,%ebx
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 52e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 532:	84 d2                	test   %dl,%dl
 534:	0f 84 8e 00 00 00    	je     5c8 <printf+0xe8>
		c = fmt[i] & 0xff;
		if (state == 0) {
 53a:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
		c = fmt[i] & 0xff;
 53c:	0f be c2             	movsbl %dl,%eax
		if (state == 0) {
 53f:	74 c7                	je     508 <printf+0x28>
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
 541:	83 ff 25             	cmp    $0x25,%edi
 544:	75 e5                	jne    52b <printf+0x4b>
			if (c == 'd') {
 546:	83 fa 64             	cmp    $0x64,%edx
 549:	0f 84 31 01 00 00    	je     680 <printf+0x1a0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 54f:	25 f7 00 00 00       	and    $0xf7,%eax
 554:	83 f8 70             	cmp    $0x70,%eax
 557:	0f 84 83 00 00 00    	je     5e0 <printf+0x100>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 55d:	83 fa 73             	cmp    $0x73,%edx
 560:	0f 84 a2 00 00 00    	je     608 <printf+0x128>
				if (s == 0) s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 566:	83 fa 63             	cmp    $0x63,%edx
 569:	0f 84 35 01 00 00    	je     6a4 <printf+0x1c4>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 56f:	83 fa 25             	cmp    $0x25,%edx
 572:	0f 84 e0 00 00 00    	je     658 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 578:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 57b:	83 c3 01             	add    $0x1,%ebx
 57e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 585:	00 
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 586:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 588:	89 44 24 04          	mov    %eax,0x4(%esp)
 58c:	89 34 24             	mov    %esi,(%esp)
 58f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 592:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 596:	e8 1d fe ff ff       	call   3b8 <write>
			} else if (c == '%') {
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
 59b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 59e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5a8:	00 
 5a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ad:	89 34 24             	mov    %esi,(%esp)
			} else if (c == '%') {
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
 5b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5b3:	e8 00 fe ff ff       	call   3b8 <write>
	int   c, i, state;
	uint *ap;

	state = 0;
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 5b8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5bc:	84 d2                	test   %dl,%dl
 5be:	0f 85 76 ff ff ff    	jne    53a <printf+0x5a>
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 5c8:	83 c4 3c             	add    $0x3c,%esp
 5cb:	5b                   	pop    %ebx
 5cc:	5e                   	pop    %esi
 5cd:	5f                   	pop    %edi
 5ce:	5d                   	pop    %ebp
 5cf:	c3                   	ret    
	ap    = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 5d0:	bf 25 00 00 00       	mov    $0x25,%edi
 5d5:	e9 51 ff ff ff       	jmp    52b <printf+0x4b>
 5da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
 5e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5e3:	b9 10 00 00 00       	mov    $0x10,%ecx
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 5e8:	31 ff                	xor    %edi,%edi
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
 5ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5f1:	8b 10                	mov    (%eax),%edx
 5f3:	89 f0                	mov    %esi,%eax
 5f5:	e8 46 fe ff ff       	call   440 <printint>
				ap++;
 5fa:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5fe:	e9 28 ff ff ff       	jmp    52b <printf+0x4b>
 603:	90                   	nop
 604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			} else if (c == 's') {
				s = (char *)*ap;
 608:	8b 45 d4             	mov    -0x2c(%ebp),%eax
				ap++;
 60b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
				ap++;
			} else if (c == 'x' || c == 'p') {
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
				s = (char *)*ap;
 60f:	8b 38                	mov    (%eax),%edi
				ap++;
				if (s == 0) s = "(null)";
 611:	b8 a6 08 00 00       	mov    $0x8a6,%eax
 616:	85 ff                	test   %edi,%edi
 618:	0f 44 f8             	cmove  %eax,%edi
				while (*s != 0) {
 61b:	0f b6 07             	movzbl (%edi),%eax
 61e:	84 c0                	test   %al,%al
 620:	74 2a                	je     64c <printf+0x16c>
 622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 628:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 62b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
				s = (char *)*ap;
				ap++;
				if (s == 0) s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
 62e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 631:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 638:	00 
 639:	89 44 24 04          	mov    %eax,0x4(%esp)
 63d:	89 34 24             	mov    %esi,(%esp)
 640:	e8 73 fd ff ff       	call   3b8 <write>
				ap++;
			} else if (c == 's') {
				s = (char *)*ap;
				ap++;
				if (s == 0) s = "(null)";
				while (*s != 0) {
 645:	0f b6 07             	movzbl (%edi),%eax
 648:	84 c0                	test   %al,%al
 64a:	75 dc                	jne    628 <printf+0x148>
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 64c:	31 ff                	xor    %edi,%edi
 64e:	e9 d8 fe ff ff       	jmp    52b <printf+0x4b>
 653:	90                   	nop
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 658:	8d 45 e5             	lea    -0x1b(%ebp),%eax
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 65b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 65d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 664:	00 
 665:	89 44 24 04          	mov    %eax,0x4(%esp)
 669:	89 34 24             	mov    %esi,(%esp)
 66c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 670:	e8 43 fd ff ff       	call   3b8 <write>
 675:	e9 b1 fe ff ff       	jmp    52b <printf+0x4b>
 67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
 680:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 683:	b9 0a 00 00 00       	mov    $0xa,%ecx
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 688:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
 68b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 692:	8b 10                	mov    (%eax),%edx
 694:	89 f0                	mov    %esi,%eax
 696:	e8 a5 fd ff ff       	call   440 <printint>
				ap++;
 69b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 69f:	e9 87 fe ff ff       	jmp    52b <printf+0x4b>
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 6a4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
			} else {
				// Unknown % sequence.  Print it to draw attention.
				putc(fd, '%');
				putc(fd, c);
			}
			state = 0;
 6a7:	31 ff                	xor    %edi,%edi
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 6a9:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6ab:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b2:	00 
 6b3:	89 34 24             	mov    %esi,(%esp)
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
 6b6:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6b9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c0:	e8 f3 fc ff ff       	call   3b8 <write>
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
				putc(fd, *ap);
				ap++;
 6c5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6c9:	e9 5d fe ff ff       	jmp    52b <printf+0x4b>
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <free>:
static Header  base;
static Header *freep;

void
free(void *ap)
{
 6d0:	55                   	push   %ebp
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	a1 54 0b 00 00       	mov    0xb54,%eax
static Header  base;
static Header *freep;

void
free(void *ap)
{
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	57                   	push   %edi
 6d9:	56                   	push   %esi
 6da:	53                   	push   %ebx
 6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 6de:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
 6e0:	8d 53 f8             	lea    -0x8(%ebx),%edx
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e3:	39 d0                	cmp    %edx,%eax
 6e5:	72 11                	jb     6f8 <free+0x28>
 6e7:	90                   	nop
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 6e8:	39 c8                	cmp    %ecx,%eax
 6ea:	72 04                	jb     6f0 <free+0x20>
 6ec:	39 ca                	cmp    %ecx,%edx
 6ee:	72 10                	jb     700 <free+0x30>
 6f0:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f2:	39 d0                	cmp    %edx,%eax
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 6f4:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f6:	73 f0                	jae    6e8 <free+0x18>
 6f8:	39 ca                	cmp    %ecx,%edx
 6fa:	72 04                	jb     700 <free+0x30>
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
 6fc:	39 c8                	cmp    %ecx,%eax
 6fe:	72 f0                	jb     6f0 <free+0x20>
	if (bp + bp->s.size == p->s.ptr) {
 700:	8b 73 fc             	mov    -0x4(%ebx),%esi
 703:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 706:	39 cf                	cmp    %ecx,%edi
 708:	74 1e                	je     728 <free+0x58>
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
 70a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
	if (p + p->s.size == bp) {
 70d:	8b 48 04             	mov    0x4(%eax),%ecx
 710:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 713:	39 f2                	cmp    %esi,%edx
 715:	74 28                	je     73f <free+0x6f>
		p->s.size += bp->s.size;
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
 717:	89 10                	mov    %edx,(%eax)
	freep = p;
 719:	a3 54 0b 00 00       	mov    %eax,0xb54
}
 71e:	5b                   	pop    %ebx
 71f:	5e                   	pop    %esi
 720:	5f                   	pop    %edi
 721:	5d                   	pop    %ebp
 722:	c3                   	ret    
 723:	90                   	nop
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) break;
	if (bp + bp->s.size == p->s.ptr) {
		bp->s.size += p->s.ptr->s.size;
 728:	03 71 04             	add    0x4(%ecx),%esi
 72b:	89 73 fc             	mov    %esi,-0x4(%ebx)
		bp->s.ptr = p->s.ptr->s.ptr;
 72e:	8b 08                	mov    (%eax),%ecx
 730:	8b 09                	mov    (%ecx),%ecx
 732:	89 4b f8             	mov    %ecx,-0x8(%ebx)
	} else
		bp->s.ptr = p->s.ptr;
	if (p + p->s.size == bp) {
 735:	8b 48 04             	mov    0x4(%eax),%ecx
 738:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 73b:	39 f2                	cmp    %esi,%edx
 73d:	75 d8                	jne    717 <free+0x47>
		p->s.size += bp->s.size;
 73f:	03 4b fc             	add    -0x4(%ebx),%ecx
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
	freep = p;
 742:	a3 54 0b 00 00       	mov    %eax,0xb54
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
	if (p + p->s.size == bp) {
		p->s.size += bp->s.size;
 747:	89 48 04             	mov    %ecx,0x4(%eax)
		p->s.ptr = bp->s.ptr;
 74a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 74d:	89 10                	mov    %edx,(%eax)
	} else
		p->s.ptr = bp;
	freep = p;
}
 74f:	5b                   	pop    %ebx
 750:	5e                   	pop    %esi
 751:	5f                   	pop    %edi
 752:	5d                   	pop    %ebp
 753:	c3                   	ret    
 754:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 75a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000760 <malloc>:
	return freep;
}

void *
malloc(uint nbytes)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 1c             	sub    $0x1c,%esp
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 769:	8b 45 08             	mov    0x8(%ebp),%eax
	if ((prevp = freep) == 0) {
 76c:	8b 1d 54 0b 00 00    	mov    0xb54,%ebx
malloc(uint nbytes)
{
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 772:	8d 48 07             	lea    0x7(%eax),%ecx
 775:	c1 e9 03             	shr    $0x3,%ecx
	if ((prevp = freep) == 0) {
 778:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 77a:	8d 71 01             	lea    0x1(%ecx),%esi
	if ((prevp = freep) == 0) {
 77d:	0f 84 9b 00 00 00    	je     81e <malloc+0xbe>
 783:	8b 13                	mov    (%ebx),%edx
 785:	8b 7a 04             	mov    0x4(%edx),%edi
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 788:	39 fe                	cmp    %edi,%esi
 78a:	76 64                	jbe    7f0 <malloc+0x90>
 78c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
	char *  p;
	Header *hp;

	if (nu < 4096) nu = 4096;
 793:	bb 00 80 00 00       	mov    $0x8000,%ebx
 798:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 79b:	eb 0e                	jmp    7ab <malloc+0x4b>
 79d:	8d 76 00             	lea    0x0(%esi),%esi
	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
 7a0:	8b 02                	mov    (%edx),%eax
		if (p->s.size >= nunits) {
 7a2:	8b 78 04             	mov    0x4(%eax),%edi
 7a5:	39 fe                	cmp    %edi,%esi
 7a7:	76 4f                	jbe    7f8 <malloc+0x98>
 7a9:	89 c2                	mov    %eax,%edx
				p->s.size = nunits;
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
 7ab:	3b 15 54 0b 00 00    	cmp    0xb54,%edx
 7b1:	75 ed                	jne    7a0 <malloc+0x40>
morecore(uint nu)
{
	char *  p;
	Header *hp;

	if (nu < 4096) nu = 4096;
 7b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 7bc:	bf 00 10 00 00       	mov    $0x1000,%edi
 7c1:	0f 43 fe             	cmovae %esi,%edi
 7c4:	0f 42 c3             	cmovb  %ebx,%eax
	p = sbrk(nu * sizeof(Header));
 7c7:	89 04 24             	mov    %eax,(%esp)
 7ca:	e8 51 fc ff ff       	call   420 <sbrk>
	if (p == (char *)-1) return 0;
 7cf:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d2:	74 18                	je     7ec <malloc+0x8c>
	hp         = (Header *)p;
	hp->s.size = nu;
 7d4:	89 78 04             	mov    %edi,0x4(%eax)
	free((void *)(hp + 1));
 7d7:	83 c0 08             	add    $0x8,%eax
 7da:	89 04 24             	mov    %eax,(%esp)
 7dd:	e8 ee fe ff ff       	call   6d0 <free>
	return freep;
 7e2:	8b 15 54 0b 00 00    	mov    0xb54,%edx
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0) return 0;
 7e8:	85 d2                	test   %edx,%edx
 7ea:	75 b4                	jne    7a0 <malloc+0x40>
 7ec:	31 c0                	xor    %eax,%eax
 7ee:	eb 20                	jmp    810 <malloc+0xb0>
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 7f0:	89 d0                	mov    %edx,%eax
 7f2:	89 da                	mov    %ebx,%edx
 7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			if (p->s.size == nunits)
 7f8:	39 fe                	cmp    %edi,%esi
 7fa:	74 1c                	je     818 <malloc+0xb8>
				prevp->s.ptr = p->s.ptr;
			else {
				p->s.size -= nunits;
 7fc:	29 f7                	sub    %esi,%edi
 7fe:	89 78 04             	mov    %edi,0x4(%eax)
				p += p->s.size;
 801:	8d 04 f8             	lea    (%eax,%edi,8),%eax
				p->s.size = nunits;
 804:	89 70 04             	mov    %esi,0x4(%eax)
			}
			freep = prevp;
 807:	89 15 54 0b 00 00    	mov    %edx,0xb54
			return (void *)(p + 1);
 80d:	83 c0 08             	add    $0x8,%eax
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0) return 0;
	}
}
 810:	83 c4 1c             	add    $0x1c,%esp
 813:	5b                   	pop    %ebx
 814:	5e                   	pop    %esi
 815:	5f                   	pop    %edi
 816:	5d                   	pop    %ebp
 817:	c3                   	ret    
		base.s.size                = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
			if (p->s.size == nunits)
				prevp->s.ptr = p->s.ptr;
 818:	8b 08                	mov    (%eax),%ecx
 81a:	89 0a                	mov    %ecx,(%edx)
 81c:	eb e9                	jmp    807 <malloc+0xa7>
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
 81e:	c7 05 54 0b 00 00 58 	movl   $0xb58,0xb54
 825:	0b 00 00 
		base.s.size                = 0;
 828:	ba 58 0b 00 00       	mov    $0xb58,%edx
	Header *p, *prevp;
	uint    nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
 82d:	c7 05 58 0b 00 00 58 	movl   $0xb58,0xb58
 834:	0b 00 00 
		base.s.size                = 0;
 837:	c7 05 5c 0b 00 00 00 	movl   $0x0,0xb5c
 83e:	00 00 00 
 841:	e9 46 ff ff ff       	jmp    78c <malloc+0x2c>
